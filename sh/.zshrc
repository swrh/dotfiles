# .zshrc

if [[ -f "$HOME/.shrc" ]]; then
	. "$HOME/.shrc"
fi

if [[ -f "$HOME/.profile" ]]; then
	. "$HOME/.profile"
fi

HISTFILE="$HOME/.zsh_history"
SAVEHIST=524288

if [[ -r "$HOME/.iterm2_shell_integration.zsh" ]]; then
	. "$HOME/.iterm2_shell_integration.zsh"
fi

activate_android()
{
	local android_home="$HOME/Library/Android/sdk"

	if [[ ! -d "$android_home" ]]; then
		echo "activate_android: missing android sdk directory" 1>&2
		return 1
	fi

	export ANDROID_HOME="$android_home"
	PATH="$PATH:$ANDROID_HOME/emulator"
	PATH="$PATH:$ANDROID_HOME/tools"
	PATH="$PATH:$ANDROID_HOME/tools/bin"
	PATH="$PATH:$ANDROID_HOME/platform-tools"

	unset -f activate_android
}
