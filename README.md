# Browser's Castle

Open your browser from Vim (only macOS)
![Browser's Castle](https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiD_Lz8k6HhAhUH3xoKHegrBZ0QjRx6BAgBEAU&url=https%3A%2F%2Fwww.slideshare.net%2Ffitc_slideshare%2Fbrowsers-castle-defend-your-code-like-a-designer&psig=AOvVaw3Omr94AK4v9KXdCmfdoiqN&ust=1553735658807757 "Browser's Castle")

## Installation ##

Use your preferred installation method for Vim plugins.

With [vim-plug](https://github.com/junegunn/vim-plug) that would mean to add
the following to your vimrc:

```vim
Plug 'iovis9/browsers_castle.vim'
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
