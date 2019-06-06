# Browser's Castle

Open your browser from Vim (only macOS)

![Browser's Castle](https://image.slidesharecdn.com/browserscastle-defendyourcodelikeadesigner-170927185250/95/browsers-castle-defend-your-code-like-a-designer-1-638.jpg?cb=1506538510)

## Installation ##

Use your preferred installation method for Vim plugins.

With [vim-plug](https://github.com/junegunn/vim-plug) that would mean to add
the following to your vimrc:

```vim
Plug 'iovis/browsers_castle'
```

## Usage ##

This plugin provides commands for the mainstream browser and some of their
development versions, see the docs for the full list

```vim
:Chrome https://google.com  " Open google.com in Chrome
:Canary :3000               " Open http://localhost:3000 in Google Chrome Canary
:Firefox %                  " Open current file in Firefox
:Google symlink syntax      " I honestly had to search this one while developing this plugin
```
