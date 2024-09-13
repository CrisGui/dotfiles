# system
alias .="cdi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias md="mkdir -pv"
alias cp="cp -rv"
alias rm="rm -rv"
alias cls="clear"
alias ping="ping -c4"
alias now="date +'%Y-%m-%d-%T'"
alias new-alias="nvim \$HOME/.bash_aliases && source \$HOME/.bash_aliases"
alias myip="curl ipinfo.io/ip"
alias df="df -Tha --total"
alias free="free -mtl"
alias ps="ps auxf"
alias psg="ps aux | rg -v rg | rg -ie VSZ -e"
alias mount="mount | column -t"
alias mnt="mount | rg -e ^/dev"

# fd
alias fd="fd . --full-path --no-ignore"

# trash
alias del="trash-put"

# neovim
alias v="nvim"

# eza
alias l="eza -aXgbhiS@Z --icons --time-style '+%Y-%m-%d' --git --smart-group --group-directories-first -s type -F=always --color=always --hyperlink"
alias ll="eza -laXgbhiS@Z --icons --time-style '+%Y-%m-%d' --git --smart-group --group-directories-first -s type -F=always --color=always --hyperlink"
alias llt="eza -1lXabhHiUm@T --git-repos --git --time-style '+%Y%m%d%H%M%S' --smart-group --sort type --icons=always --color=always --classify=always -L"
alias tree="eza -aTL"

# yay
alias pkgI="yay -Slqy | fzf --multi --cycle --layout reverse --prompt 'Packages to install: ' --preview 'yay -Sii {1}' | xargs -ro yay -S --needed"
alias pkgR="yay -Qq | fzf --multi --cycle --layout reverse --prompt 'Packages to uninstall: ' --preview 'yay -Qii {1}' | xargs -ro yay -Rns"
alias pkgL="yay -Qq | fzf --multi --cycle --layout reverse --prompt 'Packages: ' --preview 'yay -Qii {1}'"
alias pkgS="yay -Slqy | fzf --multi --cycle --layout reverse --prompt 'Packages: ' --preview 'yay -Sii {1}'"

# docker
#alias docker-rmi="docker rmi \$(docker image ls -aq)"
