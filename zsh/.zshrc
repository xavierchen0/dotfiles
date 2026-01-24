# -- Custom env vars --
# Home config dir
export XDG_CONFIG_HOME="$HOME/.config"

# Man Page
export MANWIDTH=100 # Set man page width
export MANPAGER='nvim +Man!'

# Default editor
export EDITOR='nvim'
export VISUAL='nvim'

# -- Custom commands --
function cfg() {
  cd "${XDG_CONFIG_HOME}"
}

# -- Custom aliases --
alias ls="eza --color=always --icons=always"
alias bb="brew bundle --verbose"

# -- zsh keybinds --
bindkey -e # use emacs keybind so i can CTRL-A/CTRL-E

# -- Shell Prompt --
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/omp/config.omp.toml)"
fi

# -- Init Homebrew env vars --
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/Brewfile"

# -- Init autocomplete --
autoload -Uz compinit
compinit

# -- Yazi; y to enter Yazi, q to quit at cwd, Q to quit at previous dir --
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# -- eza completion --
export FPATH="${HOME}/.local/share/eza/completions/zsh:$FPATH"

# -- television shell integration --
# https://alexpasmantier.github.io/television/docs/Users/shell-integration
eval "$(tv init zsh)"
