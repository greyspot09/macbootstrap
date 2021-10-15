export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH:$M2_HOME/bin
export LANG=en_US.UTF-8
plugins=(extract encode64 urltools brew zsh-syntax-highlighting zsh-autosuggestions)
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
PROMPT=$'%{$purple%}%n%{$reset_color%} in %{$limegreen%}%~%{$reset_color%}$(ruby_prompt_info " with%{$fg[red]%} " v g "%{$reset_color%}")$vcs_info_msg_0_%{$orange%}%{$reset_color%} at %{$hotpink%}%* %{$orange%}λ%{$reset_color%} '

DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

fpath=(/usr/local/share/zsh-completions $fpath)
compinit -u

HISTCONTROL=ignorespace
HISTFILE=~/.histfile
HISTSIZE=10000000
HISTFILESIZE=10000000
SAVEHIST=10000000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

BS_ZSH_BASE="$HOME/.macbootstrap"
BS_ZSH_TOOLS=${BS_ZSH_BASE}/tools

source $BS_ZSH_BASE/basic.sh
source $BS_ZSH_BASE/zsh-config/common.sh
source /usr/local/etc/profile.d/autojump.sh
if brew ls --versions scmpuff > /dev/null; then
    eval "$(scmpuff init -s --aliases=false)"
fi

fpath=(/usr/local/share/zsh-completions $fpath)

# GO
#export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOBIN

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# for nvm
#export NVM_DIR=~/.nvm
#export EDITOR="nvim"
##source $(brew --prefix nvm)/nvm.sh
#export NVM_SH="/usr/local/opt/nvm/nvm.sh"
## https://github.com/creationix/nvm/issues/860
#declare -a NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
#
#NODE_GLOBALS+=("node")
#NODE_GLOBALS+=("nvm")
#
#load_nvm () {
#  [ -s "$NVM_SH" ] && . "$NVM_SH"
#}
#
#for cmd in "${NODE_GLOBALS[@]}"; do
#  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
#done

# Bind key
bindkey ';' autosuggest-execute

#archey -o
autoload -U bashcompinit
bashcompinit


alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code';
VSC_BIN='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin';



###################  以下代码修改zsh 粘贴很慢的问题 #################################
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
#zstyle :bracketed-paste-magic paste-init pasteinit
#zstyle :bracketed-paste-magic paste-finish pastefinish

###################  以下代码修改zsh 粘贴很慢的问题 END #################################

################### Flutter ###################################################
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=~/flutter/bin:$PATH
################### Flutter End ###################################################


################### frida ###################################################
alias dump.py="/opt/dump/frida-ios-dump/dump.py"
################### frida ###################################################

################### Android Home ###################################################
export ANDROID_HOME=/Users/liucien/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

apkInfo() {
    if [[ "$1" == "" ]]; then
        echo  "cannot find apk"
        return
    fi

    ANDROID_BUILD_TOOLS=$(ls -l "$ANDROID_HOME/build-tools"| cut -d' ' -f14 | sort -r | head -n1)
    if [[ "$ANDROID_BUILD_TOOLS" == "" ]]; then
        echo 'ANDROID_BUILD_TOOLS is empty'
        return
    else
        echo '$ANDROID_BUILD_TOOLS:' $ANDROID_BUILD_TOOLS
    fi
    $ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS/aapt dump badging $1 | head -n3
}

export ANDROID_SDK=/Users/liucien/Library/Android/sdk
export ANDROID_NDK=/Users/liucien/Library/Android/ndk/android-ndk-r16b

export NDK_HOME=/Users/liucien/Library/Android/ndk/android-ndk-r21b
export ANDROID_NDK_HOME=/Users/liucien/Library/Android/ndk/android-ndk-r21b
export ANDROID_HOME=/Users/liucien/Library/Android/sdk

export PATH=${PATH}:$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/
################### Android Home End ###################################################


################### Go Home ###################################################
export GOPATH=$HOME/go
export PATH=${PATH}:${GOPATH}/bin

export GOPROXY="https://goproxy.cn,direct"
################### Go Home End ###################################################


################### Go Home ###################################################
export THEOS=/opt/theos
export PATH=${PATH}:${THEOS}/bin
export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=2222
################### Go Home End ###################################################



export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export MonkeyDevPath=/opt/MonkeyDev
export MonkeyDevDeviceIP=
export PATH=/opt/MonkeyDev/bin:$PATH




#### rubenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
