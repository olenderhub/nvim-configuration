# #!/bin/sh

sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

echo "`tput setaf 3``tput bold`Neovim installation has started`tput sgr0`"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
echo "`tput setaf 2``tput bold`Neovim installation has finished`tput sgr0`"

echo "`tput setaf 3``tput bold`Fzf installation has started`tput sgr0`"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "`tput setaf 2``tput bold`Fzf installation has finished`tput sgr0`"

echo "`tput setaf 3``tput bold`Powerline fonts installation has started`tput sgr0`"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
echo "`tput setaf 2``tput bold`Powerline fonts installation has finished`tput sgr0`"
# for iterm open the profiles/text and install here 18pt Fira Code and for Non-ASCII Font 18pt Hack Regular

mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim ~/.config/nvim/init.vim
