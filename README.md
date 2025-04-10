My neovim configuration.

### Global

#### Useful mappings

### C++

#### Packages
- `clangd` - C++ LSP server
### Python

#### Packages
- `pyright` - Python LSP server
#### Virtual Environment
The python configuration requires virtual environment for python's packages. The editor is configured to use a `venv` created as follows:
```
python3 -m venv ~/.venvs/nvim
```
To verify if it is correctly installed, run in vim:
```
:echo g:python3_host_prog
```
### Haskell

#### Packages
- `hls` - Haskell LSP server
