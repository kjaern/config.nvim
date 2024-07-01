# config.nvim
## Windows
My neovim config, for now there are a few things specific to windows. Specifically python paths... Would like to get rid of these!

It assumes there is a conda env on this location:
%userprofile%\pythonNvim

In a miniconda terminal run:
conda create --prefix %userprofile%\pythonNvim -y python==3.11 pynvim 

For all packages to work, please ensure that the following is installed:
* c and cpp compiler - (just install zig...)
    * on windows choco install zig 
* node -
    * on windows choco install nodejs-lts --version="20.14.0"

* choco install fd (used by python-venv)
* choco install stylua


## Linux
* sudo snap install neovim --classic

* sudo apt install nodejs

* sudo apt-install fd-find

* git clone https://github.com/kjaern/config.nvim.git ~/.config/nvim


## Raspberry pi
* build neovim from source

* make sure en_US and/or en_US.UTF-8 is insalled, so outcomment them in 
/etc/locale.gen
sudo update-locale en_US.UTF-8 UTF-8

* get node.js for lsp servers, sudo apt install nodejs npm

