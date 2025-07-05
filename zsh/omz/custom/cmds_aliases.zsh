alias cfg="cd $HOME/.config/"

alias dev="cd $HOME/dev/"

alias ls="eza --icons=always"

cd () {
  builtin cd "$1" && ls -a
}

alias kvim='NVIM_APPNAME=nvim-kickstart nvim'
alias lvim='NVIM_APPNAME=nvim-lazyvim nvim'
