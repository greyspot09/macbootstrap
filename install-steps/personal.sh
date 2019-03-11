username='liucien'

# Write script you want to use in the `if` block
if [[ "$username" == $(whoami) ]]; then
    # HomeBrew
    brew cask install google-drive-file-stream

    # Git config
    git config --global user.name hongmou.liu
    git config --global user.email hongmou.liu@gmail.com

    if [[ ! -d $HOME/.ssh ]]; then
        mkdir $HOME/.ssh
    fi

    # ssh key
    if [[ ! -f $HOME/.ssh/id_rsa ]]; then
        chmod 400 $HOME/.macbootstrap/config/id_rsa
        ln -s $HOME/.macbootstrap/config/id_rsa $HOME/.ssh/
    fi

    if [[ ! -f $HOME/.ssh/id_rsa.pub ]]; then
        ln -s $HOME/.macbootstrap/config/id_rsa.pub $HOME/.ssh/
    fi

    ssh-add -K $HOME/.ssh/id_rsa

    # GPG_KEY
    GPG_KEY="$HOME/.macbootstrap/git-config/bestswifter.asc"
    gpg --import "$GPG_KEY"
    shred --remove "$GPG_KEY"
    git config --global user.signingkey 368B0D29D38D4B4EEE5BF51EB2468CF4358BF1CF
    git config --global commit.gpgsign true

    if [[ ! -e /Applications/Xee³.app ]]; then
        brew cask install xee
    else
        echo "You have installed xee"
    fi

    if [[ ! -e /Applications/Dropbox.app/ ]]; then
        brew cask install dropbox
    else
        echo "You have installed dropbbox"
    fi

    # CodeRunner
    # ---------------
    if [[ ! -e /Applications/CodeRunner.app/ ]]; then
        brew cask install coderunner
    else
        echo "You have installed coderunner"
    fi
fi
