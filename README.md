My neovim configuration.

### General usage plugins 
  - *LuaSnip* - general snippets functionality
  - *friendly-snippets* - set of predefined and comonly used snippets
#### Useful mappings

### C++

#### Packages
  - `clangd` - C++ LSP server
### Python

#### Packages
  - `pyright` - Python LSP server
#### Virtual Environment
The python configuration requires virtual environment for python's packages. The editor is configured to use a `venv` created as follows:
```python
python3 -m venv ~/.venvs/nvim
```
To verify if it is correctly installed, run in vim:
```
:echo g:python3_host_prog
```
### Haskell

#### Packages
- `hls` - Haskell LSP server

### TeX

#### Dependencies
- `latexmk` - may be installed via `sudo apt install latexmk`
- `TeX` packages, which may be instaled via `sudo apt install texlive-full`.
- [texpresso](https://github.com/let-def/texpresso)
- [texpresso.vim](https://github.com/let-def/texpresso.vim)

#### Packages
- `lervag/vimtex` - general TeX support extension. Provides comiling, linting etc.
- `let-def/texpresso.vim` - live TeX rendering in external window.
