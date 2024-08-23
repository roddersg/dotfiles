# aliases.zsh
# keep all your aliases here

# remove all aliases
# unalias -m '*'

# commands---------------------------------------------------

# ref: https://github.com/benmezger/dotfiles/blob/main/dot_zsh/aliases.zsh
# if eza exist, alias to ls
if (( ${+commands[eza]} )); then
	# alias eza='eza --group-directories-first --hyperlink'
    alias eza='\eza --group-directories-first --color never'
    alias ls='eza'
    alias l='eza -1'
    alias la='eza -1a'
    alias ll='eza -l'
    alias lll='eza -l | "$PAGER"'
    alias lla='eza -la'
    alias llt='eza -T'				# tree style
    alias llfu='eza -bghHliS --git'
else
    alias l='\ls -1A'         # Lists in one column, hidden files.
    alias ll='ls -lh'        # Lists human readable sizes.
    alias lr='ll -R'         # Lists human readable sizes, recursively.
    alias la='ll -A'         # Lists human readable sizes, hidden files.
    alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
    alias lx='ll -XB'        # Lists sorted by extension (GNU only).
    alias lk='ll -Sr'        # Lists sorted by size, largest last.
    alias lt='ll -tr'        # Lists sorted by date, most recent last.
    alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
    alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
fi


alias grep='\grep --color=auto'
alias igrep='\grep -i'
alias diff="\diff --color=auto"
alias mv="\mv -i"
alias mvf="\mv"
alias rm="\rm -i"
alias rmf="\rm"
alias df="\df -h"
alias free="\free -m"


# git aliases
alias gpush="git push"
alias gpull="git pull --prune"
alias gc="git commit -m"
alias ga="git add ."

# Tmux
alias tkill="tmux kill-session -t"
alias tlist="tmux list-sessions"
alias tattach="tmux attach"

# system
alias zdd='cd $ZDOTDIR'
alias zsh-edit-alias='subl $ZDOTDIR/aliases.zsh'			# edit the aliasrc
alias zsh-edit-options='subl $ZDOTDIR/options.zsh'
alias zsh-edit='subl $ZDOTDIR/.zshrc'
alias zsh-reload='source $ZDOTDIR/.zshrc'
alias zsh-reload-alias="unalias -m '*' ; source $ZDOTDIR/aliases.zsh"
alias zsh-version='printf "zsh Manual Configuration RD $ZSHRC_VERSION"'

alias zsh_display_exports="exports -p | $PAGER"
alias zsh_display_setopts="set -o | $PAGER"

alias reboot='sudo shutdown --reboot'
alias poweroff='sudo shutdown --poweroff'

# some personal programs
alias mf='mf.sh'							# searchmusic catalog
alias ff='ff.sh'							# search folders for movie codes
alias jav='cd ~/idrive/JD/00akiba'			# change to jav folder
alias music='cd ~/Music/done/cdimages'		# music cd images

# nvim
if (( ${+commands[nvim]} )); then
	# alias nvim="/home/rodney/bin/appimage/nvim.appimage"
	alias vim=nvim
fi
# frogmouth - markdown reader
if (( ${+commands[frogmouth]} )); then
	alias mdread="frogmouth"
fi

# for mpv to read the input.conf file
if (( ${+commands[mpv]} )); then
    alias mpv="/usr/bin/mpv --no-input-default-bindings"
fi

# personal
alias pr2='f(){par2 r -q "$1" | grep "found" | sed "s|Target: |mv ../|;s|\- found||" > x.sh };f'
# get rid of mac turds
alias showdotfiles='find . -name "._*" -type f -print'
alias deldotfiles='find . -name "._*" -type f -delete'
# search javlibrary for code
alias jls='f(){ open "https://www.javlibrary.com/en/vl_searchbyid.php?list&keyword=$1" };f'
alias jrip='cd /home/rodney/python/rip;./rip_v8.py'
alias rename_mr='rename "s|Mosaic_reduce_([^\.]+)\.m|$1_MR\.m|i" *.m*'
alias javss='javss.sh'


#graphics
alias icat="kitten icat"
alias view="eog"
alias play="celluloid"



