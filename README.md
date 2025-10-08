# config.nvim
## Windows
To install 

c and cpp compiler - (just install zig...)

* winget install --id=Neovim.Neovim  -e
* winget install --id=zig.zig  -e
* winget install -e --id Anaconda.Miniconda3
* winget install --id Git.Git -e --source winget
* winget install --id=sharkdp.fd  -e
* winget install --id=BurntSushi.ripgrep.MSVC  -e
* winget install -e --id GnuWin32.Make

My neovim config, for now there are a few things specific to windows. Specifically python paths... Would like to get rid of these!


It assumes there is a conda env on this location:
%userprofile%\pythonNvim

In a miniconda terminal run:
conda create --prefix $HOME\pythonNvim -y python==3.12
conda activate .\pythonNvim
pip install pynvim debugpy pyright

git clone https://github.com/kjaern/config.nvim.git $HOME\AppData\Local\nvim

for blender support
pip intall bpy

pyreadline3

<!-- For all packages to work, please ensure that the following is installed: -->
<!--     * on windows choco install zig  -->
<!-- * node - -->
    <!-- * on windows choco install nodejs-lts --version="20.14.0" -->

<!-- * choco install -y neovim git ripgrep wget fd unzip gzip mingw make  -->
<!--         (instruction from kickstart, might be some redundancies) -->

<!-- * choco install stylua -->
<!-- * choco install luarocks -->

## Linux
* sudo snap install nvim --classic


* sudo apt-install fd-find
snap install zig --classic --beta
sudo snap install ripgrep --classic
sudo snap install node --classic
<!-- sudo apt install clang -->
<!-- sudo apt install unzip -->

sudo apt install fd-find

source /etc/environment

### If python is needed:
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

cd ~/miniconda3/bin
./conda init bash
source ~/.bashrc

conda create -p ./.config/pythonNvim -y python=3.12
conda activate ~/.config/pythonNvim
pip install debugpy pynvim pyright

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
