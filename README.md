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

## Linux

## Raspberry pi

sudo apt install nodejs npm

