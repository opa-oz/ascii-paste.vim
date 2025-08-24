```
                     .__.__                                 __                  .__         
_____    ______ ____ |__|__|         ___________    _______/  |_  ____    ___  _|__| _____  
\__  \  /  ___// ___\|  |  |  ______ \____ \__  \  /  ___/\   __\/ __ \   \  \/ /  |/     \ 
 / __ \_\___ \\  \___|  |  | /_____/ |  |_> > __ \_\___ \  |  | \  ___/    \   /|  |  Y Y  \
(____  /____  >\___  >__|__|         |   __(____  /____  > |__|  \___  > /\ \_/ |__|__|_|  /
     \/     \/     \/                |__|       \/     \/            \/  \/              \/ 
```

## Motivation
I am just learning VimScript, because I want to finish [ollama-copilot.vim](https://github.com/opa-oz/ollama-copilot.vim)

## Getting started

1.  Install [Neovim][] or the latest patch of [Vim][] (9.0.0185 or newer).

2.  Install `opa-oz/ascii-paste.vim` using vim-plug, lazy.nvim, or any other
    plugin manager.  Or to install manually, run one of the following
    commands:

    * Vim, Linux/macOS:

          git clone --depth=1 https://github.com/opa-oz/ascii-paste.vim.git \
            ~/.vim/pack/opa-oz/start/ascii-paste.vim

    * Neovim, Linux/macOS:

          git clone --depth=1 https://github.com/opa-oz/ascii-paste.vim.git \
            ~/.config/nvim/pack/opa-oz/start/ascii-paste.vim

    * Vim, Windows (PowerShell command):

          git clone --depth=1 https://github.com/opa-oz/ascii-paste.vim.git `
            $HOME/vimfiles/pack/opa-oz/start/ascii-paste.vim

    * Neovim, Windows (PowerShell command):

          git clone --depth=1 https://github.com/opa-oz/ascii-paste.vim.git `
            $HOME/AppData/Local/nvim/pack/opa-oz/start/ascii-paste.vim

    * vim-plug:

          Plug 'opa-oz/ascii-paste.vim'

    * lazy:

          { "opa-oz/ascii-paste.vim", cmd = "Ascii" }

3.  Start Vim/Neovim and invoke `:Ascii paste cat`.

[Neovim]: https://github.com/neovim/neovim/releases/latest
[Vim]: https://github.com/vim/vim

## Usage

Paste a friendly cat to the current buffer at cursor position.
```vim
:Ascii paste cat

Meanwhile in buffer:

 /\_/\  
( o.o ) 
 > ^ <
```

Shows all available ASCII art
```vim
:Ascii list

```


---

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S1UZ9P7)

