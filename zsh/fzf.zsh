# =================================================
# fzf
# =================================================

if command -v fd >/dev/null 2>&1
then
	export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
elif command -v fdfind >/dev/null 2>&1
then
	# note: fd is fdfind on Ubuntu
	export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --strip-cwd-prefix'
fi

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Resolve the bat binary once. batcat first: on Ubuntu "bat" is taken by
# bacula-console-qt (/usr/sbin/bat), which is not the real bat.
if command -v batcat >/dev/null 2>&1
then
	_bat=batcat
elif command -v bat >/dev/null 2>&1
then
	_bat=bat
fi

# Compact UI. The preview is per-widget: in FZF_DEFAULT_OPTS it leaked into
# Ctrl-R, where {} is a history line rather than a file.
export FZF_DEFAULT_OPTS="
	--height 40%
	--layout=reverse
	--border
"
if [[ -n $_bat ]]
then
	export FZF_CTRL_T_OPTS="--preview '${_bat} --style=numbers --color=always {}'"
fi

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
	local cmd result
	cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
	result=$(eval "${cmd:-fdfind . -type f}" | \
		FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS ${FZF_CTRL_T_OPTS-}" fzf) && LBUFFER+="$result"
	zle reset-prompt
}
zle -N _fzf_file_no_hidden
