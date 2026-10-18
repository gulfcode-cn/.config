# =============================================================================
# Keybindings
# =============================================================================

# Cursor shape per vi mode. zsh-vi-mode defines the ZVM_CURSOR_* constants
# when it loads (after this file is sourced), so the assignments must run in
# zvm_config(), the plugin's config hook.
zvm_config() {
	ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
	ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
	ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
}

# Disable command mode line highlight
ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none

# zsh-vi-mode resets all bindings on init, so custom bindings
# must be registered via this hook to survive.
zvm_after_init() {
	# Ctrl+Right -> forward one word (^[[1;5C is the terminal escape code)
	bindkey '^[[1;5C' forward-word

	# Ctrl+Left -> move backward one word (^[[1;5D is the terminal escape code)
	bindkey '^[[1;5D' backward-word

	# Ctrl+F -> fzf picker (no hidden files)
	bindkey '^F' _fzf_file_no_hidden

	# Ctrl+R -> fzf history (zsh-vi-mode rebinds it in viins)
	bindkey -M viins '^R' fzf-history-widget

	# Ctrl+\ -> toggle autosuggestions (useful for screen recordings)
	bindkey '^\' autosuggest-toggle

	# Up/Down -> history search by substring (^[[A/^[[B are up/down arrow escape codes)
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	
	# W -> clean and list
	bindkey '^W' CLEAN_LIST
}
