# .profile

# Configure default locale settings.
[ -n "$LANG" ] || export LANG="C"

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

[ ! -d "$HOME/bin" ] || PATH="$HOME/bin:$PATH"
[ ! -d "$HOME/.local/bin" ] || PATH="$HOME/.local/bin:$PATH"

export LESS="-R"

# include local .profile if it exists
[ ! -r "$HOME/.profile-local" ] || . "$HOME/.profile-local"

# vim:set sw=2 ts=2 noet ft=sh:
