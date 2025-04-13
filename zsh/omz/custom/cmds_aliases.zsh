alias cfg="cd $HOME/.config/"

alias dev="cd $HOME/dev/"

alias ls="eza --icons=always"

cd () {
  builtin cd "$1" && ls -a
}
