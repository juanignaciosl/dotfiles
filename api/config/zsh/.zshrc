# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias fix_homebrew="sudo chown -R $(whoami) /usr/local/var/homebrew && sudo chown -R $(whoami) /usr/local/Homebrew/"
alias fix_homebrew="sudo chmod -R g+w /usr/local/var/homebrew && sudo chmod -R g+w /usr/local/Homebrew/ && sudo chmod -R g+w /usr/local/Caskroom/ && sudo chmod -R g+w /usr/local/share/zsh/site-functions/"
alias fix_spotify="sudo chmod -R g+w /Applications/Spotify.app/ && sudo chmod g+x /Applications/Spotify.app/Contents/MacOS/* && sudo chmod g+x /Applications/Spotify.app/Contents/Frameworks/Chromium\ Embedded\ Framework.framework/Chromium\ Embedded\ Framework && sudo chmod -R g+w /usr/local/Caskroom/spotify"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source ~/.git-flow-completion.zsh

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export EDITOR='vim'

# Customize to your needs...
export PATH=~/.rvm/gems/ruby-2.1.2/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/Cellar/typesafe-activator/1.3.12/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

ssh-add -A

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/Users/juanignaciosl/.rvm/gems/ruby-2.2.3/bin:/usr/local/opt/postgresql@9.5/bin:$PATH"
# rvm --default use 2.2.3
