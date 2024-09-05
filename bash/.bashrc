#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '

source <(fzf --bash)
source <(cod init $$ bash)
eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"

if [[ -f ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi
