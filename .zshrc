fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt pure
