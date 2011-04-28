# dot.bashrc

# If not running interactively, don't do anything.
[ ! -z "${PS1}" ] || return

# Don't put duplicate lines or lines beginning with an empty space in the
# history.
HISTCONTROL="ignoredups:ignorespace"

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Disable stupid bash completion.
complete -r `complete | rev | cut -d' ' -f1 | rev`

# Load local bash shell resources.
[ ! -f "${HOME}/.bashrc-local" ] || . "${HOME}/.bashrc-local"

# vim:set ft=sh:
