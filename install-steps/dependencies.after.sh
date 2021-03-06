source basic.sh

# Homebrew
# ---------------
#brew cask install sogouinput
#sogou_base="/usr/local/Caskroom/sogouinput"
#sogou_version="$sogou_base/"`ls "$sogou_base"`
#sogou_app="$sogou_version/"`ls $sogou_version | grep .app | tail -n 1`
#open "$sogou_app"

# Extension for preview
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook provisionql quicklookapk
brew cask install --appdir='/usr/local/bin' qlimagesize qlvideo # Avoid password

# Zip tool

if [[ ! -e "/Applications/The Unarchiver.app/" ]]; then
    brew cask install the-unarchiver
else
    echo "you have installed the-unarchiver"
fi

# Sql
if [[ ! -e "/Applications/DB Browser for SQLite.app/" ]]; then
    brew cask install db-browser-for-sqlite
else
    echo "you have installed DB Browser for SQLite"
fi



##################################################
#                                                #
#                                                #
#               Install Proxifier                #
#                                                #
#                                                #
##################################################
#brew cask install proxifier
#open /Applications/Proxifier.app
#
#defaults write com.initex.proxifier.macosx.plist LicenseOwner -string "bestswifter"
#defaults write com.initex.proxifier.macosx.plist LicenseKey -string "P427L-9Y552-5433E-8DSR3-58Z68"
#bs_cp config/bs_aotu_fq.ppx "$HOME/Library/Application Support/Proxifier/Profiles/"

# Powerline-font
# ---------------
git clone --depth=1 https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Python
# ---------------
#pip3 install --trusted-host pypi.python.org neovim jedi ipython
#pip3 install --user --upgrade --trusted-host pypi.python.org PyYAML

# Gem update
#sudo gem update --system 2.7.6
#sudo gem install -n /usr/local/bin cocoapods
#sudo gem install -n /usr/local/bin cocoapods-plugins
#sudo gem install colored

# nvm & npm install
#if [[ ! -d $HOME/.nvm ]]; then
    #mkdir $HOME/.nvm
#fi
#export NVM_DIR="$HOME/.nvm"
#source $(brew --prefix nvm)/nvm.sh
#export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
#nvm install 9.11.0
#./install-steps/node_global.sh

## hook login
./install-steps/hook_login.sh

chsh -s /bin/zsh

