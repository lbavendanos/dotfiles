# =============================================================================
# Oh My Zsh
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# Prompt
# =============================================================================

eval "$(starship init zsh)"

# =============================================================================
# Environment
# =============================================================================

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR="nvim"

# =============================================================================
# PATH
# =============================================================================

export PATH="$HOME/.local/bin:$PATH"                      # Local binaries
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"    # MySQL client tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"           # PostgreSQL client tools (psql, pg_dump)
export PATH="$HOME/.composer/vendor/bin:$PATH"            # PHP Composer global packages

# =============================================================================
# Homebrew
# =============================================================================

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# =============================================================================
# NVM
# =============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# =============================================================================
# FZF
# =============================================================================

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"

export FZF_DEFAULT_OPTS="
  --height=80%
  --layout=reverse
  --border=rounded
  --info=inline
  --margin=1
  --padding=1
  --color=fg:#c5c9c5,bg:#000000,hl:#c4b28a
  --color=fg+:#c5c9c5,bg+:#0A0A0A,hl+:#b6927b
  --color=info:#8ba4b0,prompt:#8ea4a2,pointer:#c4746e
  --color=marker:#87a987,spinner:#8992a7,header:#a6a69c
  --color=border:#625e5a,gutter:#000000
  --bind='ctrl-y:preview-up'
  --bind='ctrl-e:preview-down'
  --bind='ctrl-b:preview-page-up'
  --bind='ctrl-f:preview-page-down'
"

export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:500 {}'
  --preview-window 'right:60%:border-left'
  --bind 'ctrl-/:toggle-preview'
"

export FZF_ALT_C_OPTS="
  --preview 'eza --tree --color=always --icons --level=2 {} | head -200'
  --preview-window 'right:50%:border-left'
"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window 'down:3:wrap'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =============================================================================
# Bat
# =============================================================================

export BAT_THEME="kanagawa-dragon"

# =============================================================================
# Functions
# =============================================================================

# Neovim configuration selector using fzf.
# Searches for Neovim configs in ~/.config and launches nvim with the selected one.
# Usage: nvims [file]
function nvims() {
  config=$(
    find -L "${XDG_CONFIG_HOME:-$HOME/.config}" -mindepth 2 -maxdepth 2 -name init.lua -o -name init.vim \
    | awk -F/ '{print $(NF-1)}' \
    | fzf --prompt ' Neovim Config  ' --height=~50% --layout=reverse --border
  )

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi

  NVIM_APPNAME=$config nvim "$@"
}

# =============================================================================
# Aliases
# =============================================================================

alias dotfiles="cd $HOME/.dotfiles && nvim && 1"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias claude="/opt/homebrew/bin/claude"

# Eza
alias ls="eza --icons"
alias l="eza -l --icons"
alias la="eza -la --icons"
alias ll="eza -l --icons"
alias lla="eza -la --icons"
alias lt="eza --tree --icons --level=2"
alias lta="eza --tree --icons --level=2 -a"
alias lg="eza -l --icons --git"
alias lga="eza -la --icons --git"
alias lS="eza -l --icons --sort=size"
alias lm="eza -l --icons --sort=modified"

# =============================================================================
# Local Configuration
# =============================================================================

[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
