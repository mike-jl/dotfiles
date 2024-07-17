fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt pure
setopt inc_append_history
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey -M menuselect '\r' .accept-line
