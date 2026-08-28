# The thing you should do after cloning this repo
## 1. Add environment variables in your /etc/zsh/zshenv
```bash
if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

if [[ -z "$XDG_CONFIG_HOME" ]]
then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
fi

if [[ -f "$XDG_CONFIG_HOME/git/config" ]]
then
  export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
fi
```
