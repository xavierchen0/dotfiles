alias cfg="cd $HOME/.config/"

alias ls="eza --icons=always"

cd () {
  builtin cd "$1" && ls -a
}
