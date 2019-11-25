# .zshrc
. ~/.profile

if [[ -d "$HOME/.rbenv/bin" ]]; then
	export PATH="$HOME/.rbenv/bin:$PATH"

	# Load rbenv automatically by appending
	# the following to ~/.zshrc:

	eval "$(rbenv init -)"
fi

if [[ -r "$HOME/.iterm2_shell_integration.zsh" ]]; then
	. "$HOME/.iterm2_shell_integration.zsh"
fi
