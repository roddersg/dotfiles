# .zshrc
# my customized version of zsh implementation

# Version
export ZSHRC_VERSION="2.02"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# functions, load this only once, to add the other rc files and plugins
[[ -f "$ZDOTDIR/functions.zsh" ]] && source "$ZDOTDIR/functions.zsh"

# zsh settings----------------------------------------------------------------
# exports.zsh
# env variables for zsh
# [[ -f "$ZDOTDIR/exports.zsh" ]] && source "$ZDOTDIR/exports.zsh"
zsh_add_file "exports.zsh"

# options
# zsh optionns
# [[ -f "$ZDOTDIR/options.zsh" ]] && source "$ZDOTDIR/options.zsh"
zsh_add_file "options.zsh"

# aliases.zsh
# shortcuts for most commands
# [[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
zsh_add_file "aliases.zsh"

# completions.zsh
# for cmd line completion
# [[ -f "$ZDOTDIR/completions.zsh" ]] && source "$ZDOTDIR/completions.zsh"
zsh_add_file "completions.zsh"

# keymaps.zsh
# my custom keymaps
zsh_add_file "keymaps.zsh"

# bindings.zsh
# bindings for zsh Line Editor see https://thevaluable.dev/zsh-line-editor-configuration-mouseless/
# zsh_add_file "bindings.zsh"

# reveal-command.zsh
# shows the actual cmd beign executed if it is an alias
zsh_add_file "reveal-command.zsh"


# # plugins--------------------------------------------------------------------
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# #
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZDOTDIR/plugins/zsh-autosuggestions
# source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# #
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $ZDOTDIR/plugins/fsh
# source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh
# zsh_add_plugin "fsh/fast-syntax-highlighting.plugin"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"

# #
# git clone https://github.com/zsh-users/zsh-history-substring-search $ZDOTDIR/plugins/zsh-history-substring-search
# source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
zsh_add_plugin "zsh-users/zsh-history-substring-search"
# zsh-history-substring-search configuration
zmodload zsh/terminfo
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
# if the above don't work
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# bindkey -M viins '^[[3~' beginning-of-line
# bindkey -M viins '^[OF' end-of-line

# colours
autoload -U colors && colors        # colours


# #        # completion
# #        # zstyle :compinstall filename '$ZDOTDIR/.zshrc'
# #        zstyle :compinstall  '$ZDOTDIR/.zshrc'
# #
# #        # to enable completions
# #        autoload -Uz compinit
# #        compinit

# # fzf key bindings------------------------------------------------------------
# # you need to install fzf first

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# # need to put this near the bottom
[[ ! -f "${ZDOTDIR}/.p10k.zsh" ]] || source "${ZDOTDIR}/.p10k.zsh"

# let's find out where the path is
export P_ZSHRC_0=$PATH
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi


# configure zoxide
eval "$(zoxide init zsh)"


