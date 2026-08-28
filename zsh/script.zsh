# ------------ Clear And list all files -----------------
CLEAN_LIST() {
	clear 
	eza -lh --icons --git .
	zle reset-prompt
}
zle -N CLEAN_LIST
