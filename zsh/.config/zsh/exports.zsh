#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# export TERM='rxvt-256color'
# export TERM="xterm-kitty"
export DOTFILES="$HOME/dotfiles"
export WORKSPACE="$HOME/workspace"

# XDG
# export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# zsh
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=51000                   # Maximum events for internal history
export SAVEHIST=50000                   # Maximum events in history file

# editor
export EDITOR="subl"
export VISUAL="subl"

# pagers
if (( ${+commands[most]} )); then
	export PAGER="most"
	export MANPAGER="most"
else
	export PAGER="less"
	export MANPAGER="less"
	# define colors
	# source: https://github.com/imkira/dotfiles/blob/master/.zsh/colored-man-pages.zsh
	(( ! ${+LESS_TERMCAP_mb} )) && export LESS_TERMCAP_mb=$'\E[1;31m'   # Begins blinking.
    (( ! ${+LESS_TERMCAP_md} )) && export LESS_TERMCAP_md=$'\E[1;31m'   # Begins bold.
    (( ! ${+LESS_TERMCAP_me} )) && export LESS_TERMCAP_me=$'\E[0m'      # Ends mode.
    (( ! ${+LESS_TERMCAP_se} )) && export LESS_TERMCAP_se=$'\E[0m'      # Ends standout-mode.
    (( ! ${+LESS_TERMCAP_so} )) && export LESS_TERMCAP_so=$'\E[7m'      # Begins standout-mode.
    (( ! ${+LESS_TERMCAP_ue} )) && export LESS_TERMCAP_ue=$'\E[0m'      # Ends underline.
    (( ! ${+LESS_TERMCAP_us} )) && export LESS_TERMCAP_us=$'\E[1;32m'   # Begins underline.
    # other color options
    # option 1
	# export LESS_TERMCAP_mb=$'\E[01;32m'
	# export LESS_TERMCAP_md=$'\E[01;32m'
	# export LESS_TERMCAP_me=$'\E[0m'
	# export LESS_TERMCAP_se=$'\E[0m'
	# export LESS_TERMCAP_so=$'\E[01;47;34m'
	# export LESS_TERMCAP_ue=$'\E[0m'
	# export LESS_TERMCAP_us=$'\E[01;36m'
	# export LESS=-R							# raw control chars

	# option 2
	# alternative coloring schmme
	# export LESS_TERMCAP_mb=$'\E[01;31m'
	# export LESS_TERMCAP_md=$'\E[01;38;5;74m'
	# export LESS_TERMCAP_me=$'\E[0m'
	# export LESS_TERMCAP_se=$'\E[0m'
	# export LESS_TERMCAP_so=$'\E[38;33;246m'
	# export LESS_TERMCAP_ue=$'\E[0m'
	# export LESS_TERMCAP_us=$'\E[04;38;5;146m'
fi



# fzf
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF_COLORS="bg+:-1,\
# fg:gray,\
# fg+:white,\
# border:black,\
# spinner:0,\
# hl:yellow,\
# header:blue,\
# info:green,\
# pointer:red,\
# marker:blue,\
# prompt:gray,\
# hl+:red"

# export FZF_DEFAULT_OPTS="--height 60% \
# --border sharp \
# --layout reverse \
# --color '$FZF_COLORS' \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
# export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

# # fzf key bindings------------------------------------------------------------
# # you need to install fzf first

# # Preview file content using cat (https://github.com/sharkdp/bat)
# export FZF_CTRL_T_OPTS="
#   --preview 'cat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# # CTRL-/ to toggle small preview window to see the full command
# # CTRL-Y to copy the command into clipboard using pbcopy
# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"
# # Print tree structure in the preview window
# # export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
