# 1. install dependencies
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
# 2. remove vim 
sudo apt remove vim vim-runtime gvim
sudo apt remove vim-tiny vim-common vim-gui-common vim-nox


# if pyenv is installed, set the python command to point at the system python with:
# pyenv shell system

# 3. configure
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --with-x \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

# 4. use make to install
cd ~/vim
sudo make install

# 5. Set vim as your default editor with update-alternatives.
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
