# =====================================================
# History
# =====================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# ====================================================
# Shell behaviour
# ====================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

# ====================================================
# Smart directory navigation
# ====================================================

# Initialize zoxide
eval "$(zoxide init zsh)"

# ====================================================
# Comletion
# ====================================================

# Load completion system
autoload -Uz compinit

# Load completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select=2

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ====================================================
# Fuzzy finder
# ====================================================

# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]
then
	source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
	source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]
then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]
then 
	source /usr/share/doc/fzf/examples/key-bindings.zsh
	source /usr/share/doc/fzf/examples/completion.zsh
fi

# =====================================================
# Tmux 
# =====================================================
if [[ -z $TMUX ]]; then
	tmux attach -t main || tmux new -s main
fi

# =====================================================
# ssh-agent
# =====================================================
if [[ -z "$SSH_AUTH_SOCK" ]]; then
	eval "$(ssh-agent -s)" >/dev/null
fi

# =====================================================
# Fastfetch
# =====================================================
fastfetch

# =====================================================
# Modular Config Files
# =====================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# Script
source "$ZDOTDIR/script.zsh"

# Plugins and plugin manger
source "$ZDOTDIR/plugins.zsh"

