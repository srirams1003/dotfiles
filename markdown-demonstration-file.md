# How to preview markdown in the browser

#### With my current dev config, all you have to do is:

```
<Leader> c
```

This runs the command `:MarkdownPreviewToggle` which launches a server in the browser that previews your md file with real time updates as you make changes, without even needing to save your file to see the updates

## Prettier

Doing `<Leader> h` will run `:Prettier` which formats your md file to make it look pretty.

## Links

[Link text I have](https://google.com)
(link)

## Images

![alt text here](https://i.imgur.com/7a5yEii_d.webp?maxwidth=560&fidelity=grand "title here")
(img)

## Headings

# Heading 1 # (sec)

## Heading 2 ## (ssec)

### Heading 3 ### (sssec)

#### Heading 4 #### (par)

##### Heading 5 ##### (spar)

## Code Blocks

```
code block goes here
```

(cbl)

## Inline Code

`code goes here` (ilc)

## Text Styles

**bold text here** (\*\*)

_Italic text here_ (\*)

**_Bold and Italic_** (\*\*\*)

## Dates and Times

2023-11-08 (date)

20:57 (time)

2023-11-08 20:57 (datetime)

2023-11-08 20:56:01-0600 (diso)

## After you are done making changes to your markdown file, just run this command below to get a html file

```
markdown-it <name of markdown file to convert>.md -o <desired name of equivalent html file>.html
```

## Interesting stuff

-   Follow up to Interesting stuff

    -   Follow up to follow up to Interesting stuff

-   #### [Here is a link on how to write math in markdown](https://csrgxtu.github.io/2015/03/20/Writing-Mathematic-Fomulars-in-Markdown/)
    -   $d^{2}$
    -   $\alpha$

## Closing thoughts

I think it is really cool how markdown and nvim can be used together to make note-takers more productive.
