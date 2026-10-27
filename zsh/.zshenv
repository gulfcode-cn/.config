# ~/.config/zsh/.zshenv
#
#  -------------- XDG base directories ---------------------
#  Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# -------------- Editor ---------------------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# -------------- GPG ------------------------
export GPG_TTY=$(tty)

# -------------- Go -------------------------
export GOPATH="$XDG_DATA_HOME/go"

# -------------- PATH -----------------------
# Go toolchain and installed Go tools.
case ":$PATH:" in
	(*":/usr/local/go/bin:"*) ;;
	(*) export PATH="/usr/local/go/bin:$PATH" ;;
esac
case ":$PATH:" in
	(*":$GOPATH/bin:"*) ;;
	(*) export PATH="$GOPATH/bin:$PATH" ;;
esac
# Personal binaries/scripts. Add only if absent: .zshenv runs for every
# zsh process, and PATH is inherited, so unconditional prepending stacks.
case ":$PATH:" in
	(*":$HOME/.local/bin:"*) ;;
	(*) export PATH="$HOME/.local/bin:$PATH" ;;
esac

# -------------- Pager ----------------------
if command -v bat >/dev/null 2>&1; then
	export MANPAGER="batcat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
	export MANPAGER="batcat -l man -p"
fi

# -------------- Starship -------------------
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
