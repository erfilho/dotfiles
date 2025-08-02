# ========================
# 🏁 Basic Zsh Settings
# ========================
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
mkdir -p $ZSH_CACHE_DIR

# History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY EXTENDED_HISTORY INC_APPEND_HISTORY

# Completion
autoload -Uz compinit && compinit -d $ZSH_CACHE_DIR/zcompdump
zstyle ':completion:*' rehash true

# ========================
# 🚀 Zinit Plugin Manager
# ========================
source "$HOME/.zinit/bin/zinit.zsh"

# ========================
# 🎨 Theme: Powerlevel10k
# ========================
zinit light romkatv/powerlevel10k

# ========================
# 🔌 Essential Plugins
# ========================
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/history-search-multi-word

# ========================
# 🔍 fzf Integration
# ========================
if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ========================
# 📦 Aliases
# ========================
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias update='sudo dnf update && flatpak update'

# ========================
# 🛠 QoL Options
# ========================
setopt AUTO_CD
setopt CORRECT
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

# Load the p10k setup file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

