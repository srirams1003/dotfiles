# dotfiles

Bootstrap scripts for a fresh Linux install. Two scripts, run in order, take a bare machine
to a working zsh + tmux + Neovim + i3 setup — including cloning my
[nvim config](https://github.com/srirams1003/lua-nvim-config) and
[i3 dotfiles](https://github.com/srirams1003/i3-dotfiles) into place.

Debian/Ubuntu (apt) is the assumed base.

---

## Reproduce the setup

```bash
source ./firstScript.sh
```

Then **log out and back in** so zsh becomes the login shell, and:

```bash
source ./secondScript.sh
```

The second script prints a summary of what is left when it finishes. In short: log out
and back in, `prefix + I` in tmux, generate a per-machine SSH key, and restore your shell
history from the encrypted bundle with
[`machine-migrate`](https://github.com/srirams1003/i3-dotfiles#migrating-to-a-new-machine).

Those four are deliberately manual: two need a fresh login shell, one needs you to paste a
key into GitHub, and one needs a passphrase only you have.

---

## What each script does

### `firstScript.sh` — the minimum to get a usable shell

apt update/upgrade, then `zsh`, `nodejs`, `npm`, `vim`, `tmux`, `xsel`, `curl`, `wget`,
`git`. Installs `n` and pins Node to stable, adds `prettier` and `markdown-it`, then
installs oh-my-zsh — which ends by dropping you into a new shell, hence the log out / log
in before part two.

### `secondScript.sh` — everything else

- **zsh plugins**: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- **PPAs**: neovim unstable, fastfetch
- **CLI tooling**: `ripgrep`, `fzf`, `bat`, `tldr`, `htop`, `xclip`, `xdotool`,
  `imagemagick`, `tesseract-ocr`, `dict`, `ffmpeg`, `valgrind`, `cmake`, `git-extras`,
  `wdiff`, and a few toys (`sl`, `cowsay`, `cmatrix`)
- **Configs**: clones `lua-nvim-config` → `~/.config/nvim` and `i3-dotfiles` →
  `~/.config/i3`, then symlinks `.zshrc`, `.p10k.zsh` and `.tmux.conf` into `$HOME`.
  **`i3-dotfiles` is a private repo** — that clone needs credentials, and will fail for
  anyone else running this script. Everything before and after it still works.
- **Language servers**: `pyright`, `typescript-language-server`, `clangd`,
  `vscode-langservers-extracted` (HTML), `css-variables-language-server`, `gopls`
- **git config**: identity, `credential.helper store`, `nvimdiff` as the diff tool

---

## Branch per machine

Like the i3 repo, each branch is a whole environment for one machine rather than a variant
of a shared base: `main`, `wsl2-windows11`, `arch`, `new-arch`, `fedora`, `new_fedora`,
`macos`, `multipass`, `linux-mint-on-VM-with-host-as-windows11`.

Check out the branch matching the box you are setting up.

---

## Everything else in here

| File | Purpose |
|---|---|
| `karabiner.json` | macOS key remapping (Karabiner-Elements) |
| `flatpaks.txt` | flatpak app IDs to reinstall. Neither script installs flatpak or adds a remote, so do that first, then `xargs -a flatpaks.txt flatpak install -y flathub` |
| `cht.sh` | fzf picker over [cht.sh](https://cht.sh) cheatsheets; opens the answer in a new tmux window |
| `lspTestFiles/` | one trivial `hello` file per language (C, C++, Go, Java, JS, TS, Python, Ruby, HTML) to confirm each language server actually attaches after a fresh install |
| `markdown-demonstration-file.md` | markdown rendering / preview test |
| `fixing_libcurses_error_stm32cubeide.sh` | one-off fix for an STM32CubeIDE libcurses error |

---

## Related

- [`srirams1003/lua-nvim-config`](https://github.com/srirams1003/lua-nvim-config) — Neovim config
- [`srirams1003/i3-dotfiles`](https://github.com/srirams1003/i3-dotfiles) — i3wm, zsh, tmux, terminal *(private)*
