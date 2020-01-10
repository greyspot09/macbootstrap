username='liucien'

# Write script you want to use in the `if` block
if [[ "$username" == $(whoami) ]]; then
    # HomeBrew
    #brew cask install google-drive-file-stream

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
    #GPG_KEY="$HOME/.macbootstrap/git-config/bestswifter.asc"
    #gpg --import "$GPG_KEY"
    #shred --remove "$GPG_KEY"
    #git config --global user.signingkey 368B0D29D38D4B4EEE5BF51EB2468CF4358BF1CF
    #git config --global commit.gpgsign true

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

    # Install Charles
    if [[ ! -e /Applications/Charles.app ]]; then
        brew cask install charles
    else
        echo "You have installed Charles"
    fi

    # Install Dash
    if [[ ! -e /Applications/Dash.app ]]; then
        echo "You have installed Dash"
    else
        echo "may be future will install dash"
        #if [[ ! -e $HOME/Downloads/Dash.app.zip ]]; then
        #    curl "http://p2w4johvr.bkt.clouddn.com/Dash.app.zip" -o ~/Downloads/Dash.app.zip
        #fi

        #unzip -q $HOME/Downloads/Dash.app.zip -d /Applications
        #rm $HOME/Downloads/Dash.app.zip
    fi

    # Install Alfred
    if [[ ! -e "/Applications/Alfred 3.app" ]]; then
        echo "not install alfred"
        #if [[ ! -e "$HOME/Library/Application Support/Alfred 3" ]]; then
        #    mkdir -p "$HOME/Library/Application Support/Alfred 3"
        #fi

        # patch alfred
        # brew cask install alfred
        #sudo codesign -f -d -s - "/Applications/Alfred 3.app/Contents/Frameworks/Alfred Framework.framework/Versions/A/Alfred Framework"
        #cp tools/alfred.license.plist "$HOME/Library/Application Support/Alfred 3/license.plist"

        ## sync configuration
        #rm -rf "$HOME/Library/Application Support/Alfred 3/Alfred.alfredpreferences"
        #curl http://p2w4johvr.bkt.clouddn.com/Alfred.alfredpreferences2.zip -o "$HOME/Downloads/Alfred.alfredpreferences.zip"
        #unzip -q "$HOME/Downloads/Alfred.alfredpreferences.zip" -d "$HOME/Library/Application Support/Alfred 3"
        #rm "$HOME/Downloads/Alfred.alfredpreferences.zip"
    else
        echo "You have installed Alfred"
    fi

    if [[ ! -e /Applications/Jietu.app ]]; then
        brew cask install Jietu
    else
        echo "You have installed Jietu"
    fi


    if [[ ! -e /Applications/CheatSheet.app ]]; then
        brew cask install CheatSheet
    else
        echo "You have installed CheatSheet"
    fi


    if [[ ! -e /Applications/iMazing.app ]]; then
        brew cask install imazing
    else
        echo "You have installed iMazing"
    fi

    if [[ ! -e /Applications/Bartender\ 3.app ]]; then
        brew cask install bartender
    else
        echo "You have installed bartender"
    fi


    if [[ ! -e /Applications/PDF\ Expert.app/ ]]; then
        brew cask install pdf-expert
    else
        echo "You have installed pdf-expert"
    fi
    
fi
