
# completions.zsh
# for cmd line compoetion


# fpath is searched for more completions


# lazy load completion file
autoload -Uz compinit && compinit    # basic completion
# autoload -U compinit colors zcalc   # theming

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection


ZSH_AUTOSUGGEST_STRATEGY=(history completion)