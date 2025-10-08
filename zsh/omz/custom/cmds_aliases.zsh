alias cfg="cd $HOME/.config/"

alias dev="cd $HOME/dev/"

alias ls="eza --icons=always"

function cd () {
  builtin cd "$1" && ls -a
}

alias lvim='NVIM_APPNAME=nvim-lazyvim nvim'

function jup () {
  uv run jupynium --firefox_profiles_ini_path "/Users/xavier/Library/Application Support/Firefox/profiles.ini" --firefox_profile_name jupyter --nvim_listen_addr "$1"
}
