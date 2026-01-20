This is my [neovim](https://neovim.io/) configuration.

Currently used neovim version: `v0.12.0`

### Installation
- Uninstall previous neovim (if you have one), then verify `which nvim`.
- Remove all remaining data from previous installations:
```
./scripts/purge_nvim_data.sh
```
- Backup your previous config:
```
mv ~/.config/nvim/ ~/.config/nvim_old/
```
- Clone this repo:
```
git clone git@github.com:lndl-hlaw/neovim-config.git ~/.config/nvim/
```
- Install bob (here with `apt`, depends on your package manager):
    - Make sure you have all the dependencies (`gcc`, `rustup`)
    ```
    # install gcc
    sudo apt install gcc 

    # install rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
    source $HOME/.cargo/env
    ```
    - With that install `bob`:
    ```
    cargo install bob-nvim
    ```
- Install neovim inside bob and use it. Use version hash or latest nigtly if you want:
```
bob install nightly
bob use nightly
```
- Add bob to the `$PATH`.
```
echo 'export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
- Open `nvim` and install all the packages.

#### Other system configuration
- Install clipboard provider, e.g. for Ubuntu:
```
sudo apt install xclip
```
- Install your required LSP servers
    - `pyright` - `npm install pyright` or `pip install pyright`
    - `lua_ls` - `brew install lua-language-server`
    - `clangd` - `apt-get install clangd-12`
    - `hls` - First install dependencies with `sudo apt install libicu-dev libncurses-dev libgmp-dev zlib1g-dev` then `ghcup install hls`
    - `rust_analyzer` - `rustup component add rust-analyzer` or install [binary](https://rust-analyzer.github.io/book/rust_analyzer_binary.html#rust-analyzer-binary)
    - `glsl_analyzer` - Go to [releases](https://github.com/nolanderc/glsl_analyzer/releases), download latest for your arch and unpack in `~/.local/bin/` (or somewhere within your PATH).
- Some packages requires additional configuration:
    - telescope - `export LESS=-R` to be able to scroll through preview in telescope's pickers.

### Current packages

#### Supported custom themes
Themes are to set in vim by `:colorscheme <theme-name>`. If a theme supports both dark and white mode, it may be changed with `:set background=dark/white`.
These are my custom themes:

- [vague](https://github.com/vague2k/vague.nvim) - simple dark theme.
- [kanagawa](https://github.com/rebelot/kanagawa.nvim) -  default theme, supports both dark and white. Has variants of `lotus`, `wave`, `dragon`. 

#### Custom icons and visuals:

- [nui](https://github.com/MunifTanjim/nui.nvim) - UI Component Library.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Large icon pack.
- [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) - Markdown renderer inside buffer.
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - Adds customizable status line.

#### LSPs and parsing

- [lsp-config](https://github.com/neovim/nvim-lspconfig) - LSP configurations for multiple languages.
- [none-ls](https://github.com/nvimtools/none-ls.nvim) - use neovim as a LSP.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - parsing tool.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion plugin.
- [cmp-path](https://github.com/hrsh7th/cmp-path) - extension to `nvim-cmp`.
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - extension to `nvim-cmp`.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - extension to `nvim-cmp`.

#### Telescope

- [telescope](https://github.com/nvim-telescope/telescope.nvim) - base telescope tool.
- [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim) - UI for telescope.
- [telescope-env](https://github.com/LinArcX/telescope-env.nvim) - display env variables via telescope.
- [actions-preview](https://github.com/aznhe21/actions-preview.nvim) - add available actions preview. 

#### File explorers and buffer management

- [oil](https://github.com/stevearc/oil.nvim) - file explorer with edit in vim-like fashin functionality.
- [bufferline](https://github.com/akinsho/bufferline.nvim) - displays open buffers as tabs over currently open buffer.

#### Other packages

- [plenary](https://github.com/nvim-lua/plenary.nvim) - Lua async library for nvim.
- [Comment](https://github.com/numToStr/Comment.nvim) - comment selection using `gc`.
- [which-key](https://github.com/folke/which-key.nvim) - provide key hints for available bindings.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippets for nvim.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Complete common characters which goes in pairs.

### Bindings
TODO ...
