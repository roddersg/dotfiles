# This is the local .zenv file, which is always read and is the first file
#
# Borrow $PATH from the /etc/zsh/zshenv file
if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
    export PATH="/usr/local/bin:/usr/bin:/bin/:~/bin"
fi 

# Tell everyone the location of the config files
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi 

# Tell everyone where the zsh files are
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi 

