# run: ln -s ~/.config/zsh/.zshenv ~/.zshenv
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# zsh configs
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Add .local/bin to $PATH
# and move .zfunc from $HOME to $ZDOTDIR
typeset -U path fpath
path=(~/.local/bin ~/bin $path)
fpath+=("$ZDOTDIR/.zfunc")
