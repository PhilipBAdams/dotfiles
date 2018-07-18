# Path to your oh-my-zsh installation.
fpath+=~/.zfunc
export ZSH=/home/philip/.oh-my-zsh
#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize adb golang pass rust cargo emacs)

# Start the gpg-agent if not already running

#
# Set SSH to use gpg-agent
#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
#fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

#if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#  gpg-connect-agent /bye >/dev/null 2>&1
#fi

# Set GPG TTY
#export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
#gpg-connect-agent updatestartuptty /bye >/dev/null



# User configuration

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/philip/bin:/home/philip/.config/bar-aint-recursive:/home/philip/projects/Go/bin:/home/philip/.cargo/bin
#export EDITOR="emacsclient -c"
export XDG_CONFIG_HOME=/home/philip/.config
export GOPATH=/home/philip/projects/Go
export MPD_PORT=58124
export MPD_HOST=localhost
export PANEL_FIFO="/tmp/panel-fifo"
export PANEL_HEIGHT=18
export SAVEHIST=100000
export MAILDIR=~/documents/text/mail
setopt histignorealldups
setopt appendhistory
setopt sharehistory

# alias mpv="mpv --msg-module --msg-color"
alias pass="gopass"
alias cgo="cd $GOPATH"
alias zshrc="emacs ~/.zshrc"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -I"
alias ln="ln -i"
alias pac="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacr="sudo pacman -Rns"
alias pacs="pacman -Ss"
alias emacs="emacsclient -c"
alias music="ncmpcpp"
alias off="shutdown now"
alias xon="startx"


whats() { dig +short txt "$*".wp.dg.cx; }
define() { dict "$1" | less ;}

# OPAM configuration
. /home/philip/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/home/philip/.cfg/ --work-tree=/home/philip'
