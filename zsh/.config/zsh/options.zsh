#
# options.zsh
# these are the options for zsh (see manual)
# taken from https://github.com/Phantas0s/.dotfiles/blob/master/zsh/zshrc

setopt INC_APPEND_HISTORY         # save commands are added to the history immediately, otherwise only when shell exits.
setopt NOBEEP                     # No beep
setopt NOCASEGLOB                 # Case insensitive globbing
setopt NOCHECKJOBS                # Don't warn about running processes when exiting
setopt NUMERICGLOBSORT            # Sort filenames numerically when it makes sense
setopt RCEXPANDPARAM              # Array expension with parameters

# Navigation
setopt AUTO_CD              # Go to folder path without using cd.
# setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
# setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.  Allows regex with .*

# History
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# keep track of the directories you have visited
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
# track the folders with d
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

