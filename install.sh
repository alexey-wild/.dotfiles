#!/usr/bin/env bash

cd "$(dirname "$0")"

for f in `ls -a ./dotes/ | grep -v '\(git\|\.\)$'`
do
    # TODO Check if exists, move exist to BAK or add exists to this
    #ln -fs $PWD/$f ~
    cp -fr $PWD/dotes/$f ~
done

# Set Git author username and email
GIT_AUTHOR_NAME=`git config --global user.name`
if [[ $GIT_AUTHOR_NAME ]];
then
    git config --global user.name "$GIT_AUTHOR_NAME"
else
    echo "Please, enter user name for git: "
    read -e GIT_AUTHOR_NAME
    git config --global user.name "$GIT_AUTHOR_NAME"
fi

# Set Git author email
GIT_AUTHOR_EMAIL=`git config --global user.email`
if [[ $GIT_AUTHOR_EMAIL ]];
then
    git config --global user.email "$GIT_AUTHOR_EMAIL"
else
    echo "Please, enter email name for git: "
    read -e GIT_AUTHOR_EMAIL
    git config --global user.email "$GIT_AUTHOR_EMAIL"
fi

# Generate default ssh key
if [[ $GIT_AUTHOR_EMAIL ]] && [[ ! -f ~/.ssh/id_rsa.pub ]]
then
	read -r -p "Generate public/private rsa key pair? [Y/n]" response
    if [[ response ]]; then response=${response,,}; fi
	if [[ $response =~ ^(yes|y| ) ]]; then
		ssh-keygen -t rsa -C "$GIT_AUTHOR_EMAIL"
    fi
fi

# OS dependency
if [[ "$OSTYPE" == "darwin"* ]]
then
    # Installing Homebrew on OSX
    curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh | sh
    cp -fr $PWD/os/darwin/.brewfile ~
    echo "export HOMEBREW_BREWFILE=~/.brewfile" >> ~/.exports

    echo "#Homebrew" >> ~/.exports
    echo "if command -v brew > /dev/null && command -v brew-file > /dev/null;then" >> ~/.exports
    echo "[ -r $DOTFILES_DIR/os/darwin/scripts/brew-wrap ] && source $DOTFILES_DIR/os/darwin/scripts/brew-wrap" >> ~/.exports
    echo "fi" >> ~/.exports
elif [[ "$OSTYPE" == "linux"* ]]; then
    # sudo apt-add-repository ppa:fish-shell/release-2
#    if [[ $(grep "$DISTRIB_ID" /etc/*-release | awk -F '=' '{print $2}') == 'Ubuntu' ]]
#    then
        sudo apt-get install $(grep -vE "^\s*#" $PWD/os/linux/apt/.aptfile | tr "\n" " ")
#    else
#        echo 'Not supported OS dist'
#        exit 1
#    fi
    sudo chsh -s `which fish`
    curl -fsSL http://get.oh-my.fish | fish
    omf install $(grep -vE "^\s*#" $PWD/os/linux/apt/.omffile | tr "\n" " ")
fi
