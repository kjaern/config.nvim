# config.nvim
## Windows
My neovim config, for now there are a few things specific to windows. Specifically python paths... Would like to get rid of these!

It assumes there is a conda env on this location:
%userprofile%\pythonNvim

In a miniconda terminal run:
conda create --prefix %userprofile%\pythonNvim -y python==3.11 pynvim 
pip install pynvim debugpy
or better yet, for blender support
conda create --prefix %userprofile%\pythonNvim -y python==3.11.7 pynvim debugpy
pip intall bpy 

For all packages to work, please ensure that the following is installed:
* c and cpp compiler - (just install zig...)
    * on windows choco install zig 
* node -
    * on windows choco install nodejs-lts --version="20.14.0"

* choco install -y neovim git ripgrep wget fd unzip gzip mingw make 
        (instruction from kickstart, might be some redundancies)

* choco install stylua
* choco install luarocks

## Linux
* sudo snap install neovim --classic

* sudo apt install nodejs

* sudo apt-install fd-find

* git clone https://github.com/kjaern/config.nvim.git ~/.config/nvim


## Raspberry pi
* build neovim from source, description can be found here:
https://github.com/neovim/neovim/blob/master/BUILD.md
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
sudo apt-get install git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
add 
export PATH="$HOME/neovim/build/bin/nvim:$PATH"
to
build/bin/nvim ~/.bashrc



* make sure en_US and/or en_US.UTF-8 is insalled, so outcomment them in 
/etc/locale.gen
sudo update-locale en_US.UTF-8 UTF-8

* get node.js for lsp servers, 
sudo apt install nodejs npm

sudo apt-get intsll fd-find
sudo apt-get install ripgrep
