# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  # docker
  # docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Editor
export EDITOR="nvim"

# Path base
export PATH="$HOME/.local/bin:$PATH"

# MYSQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# POSTGRES
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# COMPOSER
export PATH="$HOME/.composer/vendor/bin:$PATH"

# HOMEBREW
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF configuration (use fd)
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"

# FZF Kanagawa Dragon theme + options
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
"

# FZF Ctrl+T: file search with bat preview
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:500 {}'
  --preview-window 'right:60%:border-left'
  --bind 'ctrl-/:toggle-preview'
"

# FZF Alt+C: directory search with eza preview
export FZF_ALT_C_OPTS="
  --preview 'eza --tree --color=always --icons --level=2 {} | head -200'
  --preview-window 'right:50%:border-left'
"

# FZF Ctrl+R: history search
export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window 'down:3:wrap'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# BAT
export BAT_THEME="kanagawa-dragon"

# Load local secrets (NOT committed)
# Create ~/.zshenv.local and put API keys there
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"

# NVIM multi-config selector
function nvims() {
  config=$(
        find -L "${XDG_CONFIG_HOME:-$HOME/.config}" -mindepth 2 -maxdepth 2 -name init.lua -o -name init.vim \
        | awk -F/ '{print $(NF-1)}' \
        | fzf --prompt ' Neovim Config  ' --height=~50% --layout=reverse --border)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi

  NVIM_APPNAME=$config nvim "$@"
}

# Aliases
alias dotfiles="cd $HOME/.dotfiles && nvim && 1"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias claude="/opt/homebrew/bin/claude"
