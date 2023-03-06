# Set up the prompt

autoload -Uz vcs_info

setopt histignorealldups sharehistory PROMPT_SUBST

# cats found here: https://cutekaomoji.com/animals/cats/
NEWLINE=$'\n'
PS1="${NEWLINE}%(?.%F{cyan}/ᐠ｡ˬ｡ᐟ\ฅ%f.%F{9}/ᐠ-ᆽ-ᐟ\ฅ%f) %F{green}%~%f $"

# User Config
export EDITOR='nvim'

# GO Path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# Path
export PATH=$PATH:$GOBIN:$GOROOT/bin:$HOME/.personal/sumneko/bin/lua-language-server:$HOME/.local/bin:$PATH
#export PATH=$PATH:$GOBIN:$GOROOT/bin:$HOME/.personal/sumneko/bin/lua-language-server

#Aliases
alias vim="nvim"
alias v="nvim"
alias t="tmux"
alias tmain="tmux attach-session -t main"
alias vrc="cd ~/.dotfiles/nvim/.config/nvim/ && v ."
alias zrc="vim ~/.zshrc"
alias zsrc="source ~/.zshrc"
alias dot="cd ~/.dotfiles && v ."
alias keeb="cd && cd qmk_firmware/keyboards/ferris/keymaps/default && v ."

# window manager
alias wm-r="bspc wm -r"
alias sx-r="pkill -USR1 -x sxhkd"

alias nrd="npm run dev"
alias cr="cargo run"
alias sussy="systemctl suspend"
alias sxreload="pkill -USR1 -x sxhkd"
alias resetaudio="systemctl --user restart wireplumber pipewire pipewire-pulse && rm -r ~/.config/pulse"

# git
alias gaa="git add . && git status"
alias gc="git commit -m"
alias gp="git push"
alias fbg="feh --bg-fill"
alias gaac="gaa && gc \"quick push\" && gp origin main"

# directories
lsauto="ls --color=auto -F"
if [[ "$OSTYPE" == "darwin"* ]]; then
    lsauto="ls -G"
fi
alias l=$lsauto
alias ll=$lsauto
alias la="ls -lhF"
alias mkdir="mkdir -p"

# wallpaper
alias safemode="fbg ~/wallpapers/bg_02.jpg"
alias coomer="fbg ~/wallpapers/bg_01.jpg"
alias lulwut="fbg ~/wallpapers/lulwut.png"
alias lucifer="fbg ~/wallpapers/lucifer.jpg"
alias monsters="fbg ~/wallpapers/monsters.webp"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



export NVM_DIR="/home/dylan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias luamake=/home/dylan/lua-language-server/3rd/luamake/luamake
PATH="$HOME/.local/bin:$PATH"
