# Install chisel for debugging in lldb

toolPath="$HOME/.tool"

if [[ ! -d "$toolPath" ]]; then
    mkdir $toolPath
fi

dslldbPath="$toolPath/dslldb"
if [[ ! -d "$dslldbPath" ]]; then
    git clone https://github.com/DerekSelander/LLDB $dslldbPath
fi

chiselPath="$toolPath/chisel"
if [[ ! -d "$chiselPath" ]]; then
    git clone https://github.com/facebook/chisel $chiselPath
fi

if [[ ! -e ~/.lldbinit ]]; then
    cp ~/.macbootstrap/config/.lldbinit ~/.lldbinit
else
    if grep -q "chisel/libexec/fblldb.py" "$HOME/.lldbinit"; then
        echo "Chisel is installed"
    else
        echo "" >> ~/.lldbinit
        echo "# load lldb commmand by facebook"  >> ~/.lldbinit
        echo "command script import $chiselPath/libexec/fblldb.py" >> ~/.lldbinit
    fi

    if grep -q  "lldb_commands/dslldb.py"   "$HOME/.lldbinit"; then
        echo "dslldb is installed"
    else
        echo "" >> ~/.lldbinit
        echo "# load lldb commmand by https://github.com/DerekSelander/LLDB" >> ~/.lldbinit
        echo "command script import $dslldbPath/lldb_commands/dslldb.py" >> ~/.lldbinit
    fi

    # import my own lldb configuration
    if grep -q "bs_lldb_extension" "$HOME/.lldbinit"; then
        echo "your lld extension is installed"
    else
    echo "" >> ~/.lldbinit
    echo "# load lldb commmand alias and configuration provided by bestswifter" >> ~/.lldbinit
    echo "command source ~/.macbootstrap/zsh-config/bs_lldb_extension" >> ~/.lldbinit
    fi
fi



