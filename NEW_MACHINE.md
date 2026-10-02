# Setting up a new machine

The single source of truth. Everything else links here; nothing else restates it.

Debian/Ubuntu assumed. Takes about 30 minutes, most of it unattended.

---

## Before you wipe the old machine

Two things, or you will lose your shell history permanently:

```bash
~/.config/i3/scripts/machine-migrate export ~/machine-state-drive.tar.gpg
```

1. Upload that file somewhere you can reach from a fresh install — Google Drive is fine,
   it is gpg AES-256 and the provider only ever sees ciphertext.
2. **Put the passphrase in a password manager.** There is no recovery. Forget it and the
   bundle is landfill.

Re-export every few months; it is a point-in-time snapshot.

---

## 1. Bootstrap

```bash
git clone https://github.com/srirams1003/dotfiles.git ~/dotfiles
cd ~/dotfiles
source ./firstScript.sh
```

**Log out and log back in** — `firstScript.sh` installs oh-my-zsh and makes zsh your login
shell, and the rest assumes you are in it.

```bash
cd ~/dotfiles
source ./secondScript.sh
```

That installs the toolchain and language servers, clones
[`lua-nvim-config`](https://github.com/srirams1003/lua-nvim-config) to `~/.config/nvim` and
[`i3-dotfiles`](https://github.com/srirams1003/i3-dotfiles) to `~/.config/i3`, symlinks
`.zshrc` / `.p10k.zsh` / `.tmux.conf`, and installs atuin.

---

## 2. Pick this machine's branch

`i3-dotfiles` and `dotfiles` use a branch per machine — they are genuinely different
environments, not variants. `secondScript.sh` clones the default (`main`), so switch if
this machine has its own:

```bash
git -C ~/.config/i3 checkout wsl2-work     # or arch / fedora / macos / multipass / …
git -C ~/dotfiles   checkout wsl2-windows11
```

`git -C ~/.config/i3 branch -a` lists them.

---

## 3. GitHub SSH access

Generate a key **for this machine**. Never copy one from another machine — the private
half should never travel.

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_personal -C "$(hostname) personal github"
cat ~/.config/i3/ssh/config.github-personal >> ~/.ssh/config && chmod 600 ~/.ssh/config
cat ~/.ssh/id_ed25519_personal.pub      # paste at github.com/settings/keys
ssh -T git@github-personal              # expect: Hi srirams1003!
```

Then point the clones at it, so pushes use the personal account rather than whatever
credential happens to be stored:

```bash
git -C ~/.config/i3 remote set-url origin git@github-personal:srirams1003/i3-dotfiles.git
git -C ~/dotfiles   remote set-url origin git@github-personal:srirams1003/dotfiles.git
git -C ~/.config/nvim remote set-url origin git@github-personal:srirams1003/lua-nvim-config.git
```

Delete the retired machine's key at `github.com/settings/keys` when you are done with it.

---

## 4. Restore shell history and work aliases

Fetch the bundle from Drive, then:

```bash
~/.config/i3/scripts/machine-migrate verify ~/machine-state-drive.tar.gpg   # check first
~/.config/i3/scripts/machine-migrate import ~/machine-state-drive.tar.gpg
```

This restores the atuin history DB, `~/.zshrc.local` (cluster aliases, Windows paths, lab
hosts) and `~/.claude/settings.json` (Claude Code hooks, permissions, project context). Import never overwrites — an existing
`~/.zshrc.local` gets the incoming copy as `.incoming` beside it.

**Skip this and everything still works, you just have an empty history.**

---

## 5. Claude Code

Not installed by the scripts — install it however you normally do, then:

```bash
claude --version
```

The tmux session-restore wiring ships with `i3-dotfiles`: `scripts/claude-tmux-*`,
`scripts/claude-panes`, and the resurrect hooks and keybindings in `.tmux.conf`. Nothing to
do there.

What does **not** ship is `~/.claude/settings.json`, which holds the `SessionStart` /
`SessionEnd` hooks that keep the Claude↔pane map fresh, plus permissions and project
context. It is restored by step 4 above, from the encrypted bundle.

If you are on a machine without the bundle, merge the portable fragment by hand — it
contains no secrets:

```bash
cat ~/.config/i3/claude/settings-hooks.json      # merge into ~/.claude/settings.json
```

Then after a reboot, restored panes come back with `claude --resume <id>` already typed:

| key | does |
|---|---|
| `prefix + C-a` | launch every mapped session |
| `prefix + C-p` | re-prime (types, no Enter) |
| `prefix + C-n` | popup the generated checklist |

## 6. tmux

Inside a tmux session:

```
prefix + I          # prefix is C-Space — installs tmux plugins
```

tmux layouts are **not** carried between machines by design: saved layouts embed pane
titles, which on a work machine are project and client names, and they reference absolute
paths that will not exist here. Layouts start fresh and survive reboots from then on.

---

## 7. Hourly backup timer

```bash
mkdir -p ~/.config/systemd/user
ln -sf ~/.config/i3/systemd-user/backup-dotfiles.service ~/.config/systemd/user/
ln -sf ~/.config/i3/systemd-user/backup-dotfiles.timer   ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now backup-dotfiles.timer
```

Keeps the tmux layout backup current. `Persistent=true`, so a machine that was asleep runs
the missed occurrence rather than skipping it.

---

## 8. Check it worked

```bash
atuin stats                       # your command history is there
ssh -T git@github-personal        # Hi srirams1003!
nvim +checkhealth                 # language servers attach
alias gke_prod_new                # ~/.zshrc.local restored
systemctl --user list-timers backup-dotfiles.timer
tmux                              # then Ctrl-R for atuin search
```

---

## Things that are deliberately not automated

| | Why |
|---|---|
| log out / back in | needs a fresh login shell |
| SSH key | you must paste the public half into a browser |
| history restore | needs a passphrase only you have |
| `prefix + I` | needs a running tmux session |

## Things that are deliberately not in any repo

Shell history, tmux layouts, clipboard exports, TLS material, `~/.zshrc.local`,
`~/.claude/settings.json`, and SSH private keys. All three repos are public; anything naming an employer, client, cluster or
host stays out of them. The encrypted bundle carries what must travel; the SSH key is
regenerated instead.
