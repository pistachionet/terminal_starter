# ==============================================================================
# P10k Configuration 
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# ==============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================================================================
#  OH-MY-ZSH CONFIGURATION
# ==============================================================================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set Theme (Powerlevel10k recommended for speed and aesthetics)
ZSH_THEME="powerlevel10k/powerlevel10k"

# ==============================================================================
# Plugins
# ==============================================================================
# - git: Essential aliases (gst, gco, etc.)
# - zsh-autosuggestions: Gray ghost text completion (Must have!)
# - zsh-syntax-highlighting: Colors commands green/red
# - z: "Jump" to directories (tracks frequency used)
# - extract: "extract <file>" works for zip, tar, gz, etc.
# - colored-man-pages: Makes `man` pages readable

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  z
  extract
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
# History Settings
# ==============================================================================
HISTSIZE=50000
SAVEHIST=10000
setopt SHARE_HISTORY      # Share history between sessions
setopt HIST_IGNORE_DUPS   # Don't record duplicates
setopt HIST_IGNORE_SPACE  # Ignore commands starting with space

# ==============================================================================
#  CUSTOM PATHS & EXPORTS
# ==============================================================================
export PATH="$HOME/.local/bin:$PATH"
export PATH=$(go env GOPATH)/bin:$PATH
export EDITOR="nvim"
export VISUAL="nvim"

# ==============================================================================
# Java Configuration
# ==============================================================================
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH="$JAVA_HOME/bin:$PATH"
