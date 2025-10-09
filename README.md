# config.nvim
This config consists of a set of preset plugins, and a set of optional ones, that needs to be enabled.
To do so, copy 

`nvim/lua/optionalPluginsDefaults.lua` to `nvim/lua/optionalPlugins.lua`

and 

`nvim/lua/languagesDefaults.lua` to `nvim/lua/languages.lua`

and outcomment the languages plugins needed.

## Windows
We need a few dependencies, like a c and cpp compiler - (just install zig...)
```
winget install --id=Neovim.Neovim  -e
winget install --id=zig.zig  -e
winget install --id Git.Git -e --source winget
winget install -e --id GnuWin32.Make
winget install -e --id OpenJS.NodeJS

git clone https://github.com/kjaern/config.nvim.git $HOME\AppData\Local\nvim
```
Optional but recomended
```
winget install --id=BurntSushi.ripgrep.MSVC  -e
winget install --id=sharkdp.fd  -e
winget install --id=jqlang.jq  -e
winget install -e --id Anaconda.Miniconda3

```

Populate the optional files:
```
cp $HOME\AppData\Local\nvim\lua\languagesDefaults.lua $HOME\AppData\Local\nvim\lua\languages.lua
cp $HOME\AppData\Local\nvim\lua\optionalPluginsDefaults.lua $HOME\AppData\Local\nvim\lua\optionalPlugins.lua
```
#### If python support is needed:

It assumes there is a conda env on this location:
$HOME\pythonNvim

In a miniconda terminal run:
```
conda create --prefix $HOME\pythonNvim -y python==3.12
conda activate $HOME\pythonNvim
pip install pynvim debugpy pyright
```

for blender support
```
pip intall bpy
```
In the working env for any project, this is also nice to have
```
pip install pyreadline3
```

## Linux
Dependencies:
```
sudo apt-get update
sudo apt-get upgrade
sudo snap install nvim --classic
sudo apt-get install build-essential
sudo snap install node --classic 
source /etc/environment

git clone https://github.com/kjaern/config.nvim.git ~/.config/nvim
```

Optional:
```
sudo apt-get install fd-find
sudo snap install ripgrep --classic
```

Populate the optional files:
```
cp ~/.config/nvim/lualanguagesDefaults.lua ~/.config/nvim/lualanguages.lua
cp ~/.config/nvim/luaoptionalPluginsDefaults.lua ~/.config/nvim/luaoptionalPlugins.lua
```

#### If python is needed:
```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

cd ~/miniconda3/bin
./conda init bash
source ~/.bashrc

conda create -p ~/.config/pythonNvim -y python=3.12
conda activate ~/.config/pythonNvim
pip install debugpy pynvim pyright
```


## Raspberry pi
Build neovim from source, description can be found here:
https://github.com/neovim/neovim/blob/master/BUILD.md
```
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
sudo apt-get install git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
``` 
Need to test this
```
echo PATH="$HOME/neovim/build/bin/nvim:$PATH">build/bin/nvim ~/.bashrc
```


* make sure en_US and/or en_US.UTF-8 is insalled, so outcomment them in /etc/locale.gen
```
sudo update-locale en_US.UTF-8 UTF-8
```

get node.js for lsp servers, 
```
sudo apt install nodejs npm

sudo apt-get intsll fd-find
sudo apt-get install ripgrep
```
