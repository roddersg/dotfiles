# useful functions
# source https://www.youtube.com/watch?v=bTLYiNvRIVI&t=1667s
# chris@machines - Machfiles code no longer there


# function to source files for inclusion
# use: zsh_add_file "exports.zsh"
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ]  && source "$ZDOTDIR/$1"
}

# function to add plugins
# use: zsh_add_plugin "zsh-users/zsh-autosuggestions"
function zsh_add_plugin(){
    PLUGIN_NAME=$(echo "$1" | cut -d "/" -f 2 )
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # for plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        # otherwise go get it from github
        git clone "https://githhub.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

# not used-------------------------------------------------------------
# for completions
function zsh_add_completion() {
    PLUGIN_NAME=$(echo "$1" | cut -d "/" -f 2 )
    if [-d "$ZDOTDIR/completions/$PLUGIN_NAME" ]; then
        # get completions file path
        completion_file="$(basename "${completion_file_path}")"
        # add it to the search path
        fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "completions/$PLUGIN_NAME/$PLUGIN_NAME.plugin"
    else
        # load it from github
        git clone "https://githhub.com/$1.git" "$ZDOTDIR/completions/$1"
        fpath+=$(ls $ZDOTDIR/completions/$PLUGIN_NAME/_*)
        # check spelling below
        rm $ZDOTDIR/.zccompdump
    fi
    completion_file="$(basename "${completion_file_path}")"
    if [ "$2" = true ] && compinit "${completion_file:1}"
}