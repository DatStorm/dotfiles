#!/usr/bin/env bash


# https://github.com/sbernheim4/dotfiles
#

function installPackages() {

    echo "=================================="
    echo "Installing ubuntu packages:"
    echo "git"
    echo "neovim"
    echo "tmux"
    echo "zsh"
    echo "fzf"
    echo "bat"
    echo "icdiff"
#    echo "shpotify"
    echo "=================================="

    cd ~/

#    unameOut="$(uname -s)"
#    case "${unameOut}" in
#        Linux*)     machine=Linux;;
#        Darwin*)    machine=Mac;;
#        CYGWIN*)    machine=Cygwin;;
#        MINGW*)     machine=MinGw;;
#        *)          machine="UNKNOWN:${unameOut}"
#    esac
#    echo ${machine}
    INSTALL_PREFIX="none"

    if [[ "$(uname)" == "Darwin" ]]; then
        # Do something under Mac OS X platform
        INSTALL="brew"
    elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
        # Do something under GNU/Linux platform
        INSTALL="sudo apt "

    elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
        # Do something under 32 bits Windows NT platform
        INSTALL="fix windows"
    elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
        # Do something under 64 bits Windows NT platform
        # FIXME:
        INSTALL="FIX: WINDOWS"
    fi



    ${INSTALL_PREFIX} install git
    ${INSTALL_PREFIX} install neovim
    ${INSTALL_PREFIX} install tmux
    ${INSTALL_PREFIX} install zsh
    ${INSTALL_PREFIX} install fzf
    ${INSTALL_PREFIX} install bat
    ${INSTALL_PREFIX} install icdiff
#    ${INSTALL_PREFIX} install shpotify

    # Sneak on colorls here --> https://github.com/athityakumar/colorls
    gem install colorls
}

function installNodeJS() {

    echo "==================================="
    echo "Installing n and NodeJS"
    echo "==================================="

    cd ~/

    curl -L https://git.io/n-install | bash
    n lts
}

function installNpmPackages() {

    echo "==================================="
    echo "Installing global npm packages"
    echo "weatherterm"
    echo "tldr"
    echo "vtop"
    echo "==================================="

    cd ~/

    npm i -g weatherterm
    npm i -g tldr
    npm i -g vtop
}

function cloneDotfiles() {

    echo "==================================="
    echo "Cloning dotfiles"
    echo "==================================="

    cd ~/

    git clone https://github.com/sbernheim4/dotfiles.git

    # Create secret keys file - used to store local env vars
    touch ~/dotfile/secret-keys.sh

    # Clone gruvbox community fork and symlink it
    git clone https://github.com/gruvbox-community/gruvbox.git ~/personal
    ln -sf ~/personal/gruvbox/colors/gruvbox.vim ~/dotfiles/vim_colors/gruvbox.vim

    # Clone zsh syntax highlighting dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}



function installVim() {
    echo "==================================="
    echo "Setting up vim"
    echo "==================================="

    cd ~/

    sudo apt install vim

    # Link vimrc for both vim and neovim
    #ln -sf ~/dotfiles/.vimrc ~/.vimrc
    #ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim

    # Set up colors folder
    #mkdir -p ~/.vim/colors
    #mkdir -p ~/.config/nvim/colors

    # Install vim-plug
    #curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


    #local colors=($(ls ~/dotfiles/vim_colors))
    #for colorFile in $colors
    #do
    #    ln -sf ~/dotfiles/vim_colors/$colorFile ~/.vim/colors/$colorFile
    #    ln -sf ~/dotfiles/vim_colors/$colorFile ~/.config/nvim/colors/$colorFile
    #done

    #echo "==================================="
    #echo "Vim and neovim setup complete"
    #echo "Once this process is complete open vim and run :PlugInstall"
    #echo "==================================="

}



#function setupTmux() {
#    echo "==================================="
#    echo "Linking tmux config"
#    echo "==================================="
#
#    cd ~/
#
#    touch ~/.tmux.conf
#    ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
#}




function useZsh() {

    echo "==================================="
    echo "Setting ZSH as default shell"
    echo "==================================="

	# User powerlevel10k zsh theme for prompt - https://github.com/romkatv/powerlevel10k#oh-my-zsh for more details
	git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

    cd ~/

    chsh -s $(which zsh)
}

function installShutter() {

    echo "==================================="
    echo "Installing Shutter"
    echo "==================================="

    cd ~/

    sudo apt install shutter
}

function installGnomeShellIntegration() {

    echo "==================================="
    echo "Installing Gnome Shell integration Chrome"
    echo "==================================="

    cd ~/

    sudo apt-get install chrome-gnome-shell

}

function installDarkTheme() {

    echo "==================================="
    echo "Installing Dark Them"
    echo "==================================="

    cd ~/

    sudo add-apt-repository ppa:noobslab/themes
    sudo apt-get update
    sudo apt-get install arc-theme

}

function update() {

    echo "==================================="
    echo "Updating system"
    echo "==================================="

    cd ~/

    sudo apt-get update
}


function installGit() {

    echo "==================================="
    echo "INstalling Git"
    echo "==================================="

    cd ~/

    sudo apt install git
}


function installMake() {

    echo "==================================="
    echo "INstalling Make"
    echo "==================================="

    cd ~/

    sudo apt install make
}


function installMaven() {

    echo "==================================="
    echo "INstalling Maven"
    echo "==================================="

    cd ~/

    sudo apt install maven
}


function installGuake() {
    # https://vitux.com/install-and-use-guake-a-drop-down-terminal-emulator-for-ubuntu/
    echo "==================================="
    echo "INstalling Guake"
    echo "==================================="

    cd ~/

    sudo apt install guake
}


function installCurl() {

    echo "==================================="
    echo "INstalling Curl"
    echo "==================================="

    cd ~/

    sudo apt install curl
}

function installZshAndZplug() {

    # depends on zsh, git and awk.
    # https://github.com/zplug/zplug
    echo "==================================="
    echo "INstalling Zsh & ZPlug"
    echo "==================================="

    cd ~/

    sudo apt install zsh 
    sudo apt-get install gawk
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    
}


function install() {

    echo "==================================="
    echo "Beginning Installation..."
    echo "==================================="

    update 
    installShutter
    installGit
    installGnomeShellIntegration
    installDarkTheme
    installVim
    installMake 
    installMaven
    installGuake
    installCurl 
    installZshAndZplug

#    installPackages
#    installNodeJS
#    installNpmPackages
#    cloneDotfiles
##    setupTmux
#    useZsh
}

install