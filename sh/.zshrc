# .zshrc

[[ ! -r "$HOME/.shrc" ]] || . "$HOME/.shrc"
[[ ! -r "$HOME/.profile" ]] || . "$HOME/.profile"

HISTFILE="$HOME/.zsh_history"
SAVEHIST=524288

if [[ -r "$HOME/.iterm2_shell_integration.zsh" ]]; then
	. "$HOME/.iterm2_shell_integration.zsh"
fi

if which tv >/dev/null; then
	eval "$(tv init zsh)"
fi

if which starship >/dev/null; then
	eval "$(starship init zsh)"
fi

# Load local zsh shell resources.
[[ ! -f "${HOME}/.zshrc-local" ]] || . "${HOME}/.zshrc-local"

# vim:set ft=sh:
