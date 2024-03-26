# Helper function aliases ======================================================

# Source script if the path exists
# Usage: xsource "/path/to/script"
function xsource() {
    [[ ! -f "$1" ]] || source "$1"
}

# Prepend a directory to the PATH environment variable
# Usage: xpath "/path/to/directory"
function xpath() {
  case ":$1:" in
    *$PATH*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

# Global variables ==============================================================

export EZA_COLORS="da=38;5;7:hd=1;35" 

export EDITOR="nvim"

# Define the TERM variable for 256 color support
export TERM="xterm-256color"

# Define cache directory, defaulting to ~/.cache if XDG_CACHE_HOME is not set
export CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}"

# NVM (Node Version Manager) directory
export NVM_DIR="$HOME/.nvm"

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# pnpm (Package Manager) home directory
export PNPM_HOME="$HOME/.local/share/pnpm"

# Env vars for colorizing manual pages with 'most' command
export PAGER="most"

export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 5) # magenta, for blinking text
export LESS_TERMCAP_md=$(tput bold; tput setaf 4) # blue, for bold text
export LESS_TERMCAP_me=$(tput sgr0) # reset to default
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 0) # yellow on black, for standout text
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # end standout mode
export LESS_TERMCAP_us=$(tput smul; tput setaf 2) # green, for underlined text
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # end underline mode
export LESS_TERMCAP_mr=$(tput rev) # reverse video
export LESS_TERMCAP_mh=$(tput dim) # half-bright
export LESS_TERMCAP_ZN=$(tput ssubm) # start subscript, using default as not widely supported
export LESS_TERMCAP_ZV=$(tput rsubm) # end subscript
export LESS_TERMCAP_ZO=$(tput ssupm) # start superscript, using default as not widely supported
export LESS_TERMCAP_ZW=$(tput rsupm) # end superscript
export GROFF_NO_SGR=1 # ensure compatibility with Konsole and Gnome-terminal


# PATH variable extension ========================================================

xpath "$HOME/.local/bin"
xpath "$HOME/.yarn/bin"
xpath "$HOME/scripts/bin"
xpath $PNPM_HOME


# Configuration variables ======================================================

ZSH_THEME="robbyrussell"

plugins=(
  git
)


# Sourced Scripts ==============================================================

# Load Oh-My-Zsh
xsource "$ZSH/oh-my-zsh.sh"

fpath+="~/.zsh_functions"
xsource "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
xsource "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
xsource "$HOME/.zsh/p10k.zsh"
fpath+="$HOME/.zsh/plugins/zsh-completions/src"
xsource ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Load aliases
xsource "$HOME/.zsh/aliases.zsh"
