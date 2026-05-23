# .profile

# Configure default locale settings.
if [ -z "${LANG}" ]; then
	LANG="C"
	export LANG
fi

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# include local .profile if it exists
if [ -f "$HOME/.profile-local" ]; then
	. "$HOME/.profile-local"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="$PATH:$HOME/.local/bin:/usr/local/sbin:/usr/sbin:/sbin"

LESS="-R"; export LESS

mkcd()
{
	mkdir -p "$@" && cd "$@"
}

# vim:set ft=sh:
