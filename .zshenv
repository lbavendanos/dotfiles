# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Load local secrets (NOT committed)
# Create ~/.zshenv.local and put API keys there
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
