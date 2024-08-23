# reveal command
# a script to show the actual cmd being run, if it is an alias
# ref: https://dev.to/equiman/reveal-the-command-behind-an-alias-with-zsh-4d96
#
# reveal_alias.zsh
# loading it with the .zshrc file
#

local cmd_alias=""

# Reveal Executed Alias
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local search=${1}
  local found="$( alias $search )"
  if [[ -n $found ]]; then
    found=${found//\\//} # Replace backslash with slash
    found=${found%\'} # Remove end single quote
    found=${found#"$search="} # Remove alias name
    found=${found#"'"} # Remove first single quote
    echo "${found} ${2}" | xargs # Return found value (with parameters)
  else
    echo ""
  fi
}

expand_command_line() {
  first=$(echo "$1" | awk '{print $1;}')
  rest=$(echo ${${1}/"${first}"/})

  if [[ -n "${first//-//}" ]]; then # is not hypen
    cmd_alias="$(alias_for "${first}" "${rest:1}")" # Check if there's an alias for the command
    if [[ -n $cmd_alias ]] && [[ "${cmd_alias:0:1}" != "." ]]; then # If there was and not start with dot
      echo "${T_GREEN}❯ ${T_YELLOW}${cmd_alias}${F_RESET}" # Print it
    fi
  fi
}

pre_validation() {
  [[ $# -eq 0 ]] && return                    # If there's no input, return. Else...
  expand_command_line "$@"
}


# Now we need to run this function every time the alias is entered. 
# Happily, ZSH has a preexec function that can be associated with a hook. 
# Just add this script after the previous on ~/.zshrc file.
#
autoload -U add-zsh-hook                      # Load the zsh hook module. 
add-zsh-hook preexec pre_validation           # Adds the hook 

# I'm not planning to remove this hook, but you can do it with this command:
# add-zsh-hook -d preexec pre_validation 

