# .bashrc

[[ ! -r "$HOME/.shrc" ]] || . "$HOME/.shrc"

# If not running interactively, don't do anything.
[ ! -z "${PS1}" -o "${-#*i}" != "${-}" ] || return 0

# Remove `command_not_found_handle' feature on Ubuntu. Used when a wrong
# command is typed and takes a loooooooong time to return to the prompt on slow
# machines.
unset command_not_found_handle

# `$PROMPT_COMMAND' is run at every command. Don't like it, don't want it.
unset PROMPT_COMMAND

# Don't put duplicate lines or lines beginning with an empty space in the
# history.
HISTCONTROL="ignoredups:ignorespace"

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Disable stupid bash completion.
complete -r

if which tv >/dev/null; then
	eval "$(tv init bash)"
fi

if which starship >/dev/null; then
	eval "$(starship init bash)"
fi

# Load local bash shell resources.
[[ ! -f "${HOME}/.bashrc-local" ]] || . "${HOME}/.bashrc-local"

# vim:set ft=sh:
