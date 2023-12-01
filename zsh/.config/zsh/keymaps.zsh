# keymaps.zsh
# custom keymaps to bind keys
#
# Commands available for use in the line editor are referred to as widgets.
# The standard widgets are listed in the zshzle manpage in the
# STANDARD WIDGETS section.
#

# Home, Ebn and Del keys
bindkey  "^[[H"   		beginning-of-line		# Home
bindkey  "^[[F"   		end-of-line				# End
bindkey  "^[[3~"  		delete-char				# Del
bindkey  "^[[3;2~"		kill-whole-line			# S-Del
