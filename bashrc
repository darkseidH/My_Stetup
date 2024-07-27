# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export QT_QPA_PLATFORM="wayland;xcb"
# export QT_STYLE_OVERRIDE=kvantum
export EDITOR=nvim
export VISUAL=zed
export GCM_CREDENTIAL_STORE=secretservice

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"
eval "$(oh-my-posh init bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/darkseid/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/darkseid/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/darkseid/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/darkseid/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#### Bash auto-completion ####
source /etc/profile.d/bash_completion.sh


#### Minikube ####
source <(minikube completion bash)
#### Aliases ####
alias kubectl="minikube kubectl --"


#### General Aliases ####

# Changing "ls" to "eza"
alias ls='eza -al --icons --color=always --group-directories-first' # my preferred listing
alias la='eza -a --icons --color=always --group-directories-first' # all files and dirs
alias ll='eza -l --icons --color=always --group-directories-first' # long format
alias lt='eza -aT --icons --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'
alias l.='eza -al --icons --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al --icons --color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --icons --color=always --group-directories-first ../../../' # ls on directory 3 levels up

# Remove a directory and all files
alias rmd='/bin/rm --recursive --force --verbose'

# Change directory aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'

#### Alias to useful commands ####
alias update='sudo dnf update -y && sudo dnf autoremove -y'
alias clean='sudo dnf clean all'
alias upgrade='sudo dnf upgrade -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf remove -y'
alias search='sudo dnf search'
alias info='sudo dnf info'

#### Functions ####

# KITTY - alias to be able to use kitty features when connecting to remote servers(e.g use tmux on remote server)
alias kssh="kitty +kitten ssh"
