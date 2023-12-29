export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/home/artu/.local/bin"
source $HOME/.myconfigs/aliases
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/packages/vcpkg"
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1 

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:${NPM_PACKAGES}/bin"

export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# auto copy kitty's term info when using ssh.
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	web-search
	sudo
	zsh-autosuggestions
	alias-tips
	zsh-syntax-highlighting
	vscode
	git-open
)

source $ZSH/oh-my-zsh.sh

# Conda
# source /opt/anaconda/bin/activate root
# conda activate evo
# source /opt/anaconda/bin/deactivate root

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ALIASES
alias topdf='soffice --headless --convert-to pdf'
alias psgrep='ps -aux | grep'
alias _='sudo'
alias 2022W=/run/media/artu/Sec/2022WINTER
alias prjd=/run/media/artu/Sec/Projects
alias sctl='_ systemctl'
alias sctls='sctl start'
alias sctlst='sctl status'
alias sctle='sctl enable'
alias sctld='sctl disable'
alias sctlsp='sctl stop'
alias sctlr='sctl daemon-reload'
alias zcfg='nvim ~/.zshrc'
alias conac='conda activate'
alias condac='conda deactivate'
alias music='_ mount -a'
alias ydl='youtube-dl'
alias svi='_ nvim'
alias vifs='svi /etc/fstab'
alias vissh='svi /etc/ssh/sshd_config'
alias vi='nvim'
alias vizsh="vi ~/.zshrc"
alias ydl="youtube-dl"
alias sps="sudo pacman -S"
alias pch="proxychains"
alias pcdl="proxychains cyberdrop-dl"
alias cdl="cyberdrop-dl"
alias nas="sudo mount -t nfs4 192.168.0.115:/volume1/artu ~/mnt/artu"
alias denas="sudo umount ~/mnt/artu"

# ESP-IDF
alias get_idf='source /opt/esp-idf/export.sh'


source ~/.myconfigs/aliases
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#export PATH="$PATH"
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Blur {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
# }}}
export PATH=$PATH:/home/artu/.spicetify
