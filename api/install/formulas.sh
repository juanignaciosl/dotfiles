#!/bin/bash

echo
echo "**************************"
echo "*** Homebrew formulas ***"
echo "*************************"
echo

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

brew install vim --override-system-vi
brew install gnu-sed --with-default-names # Install GNU `sed`, overwriting the built-in `sed`.

formulas=(

    # List of formulas http://brewformulas.org/
    ### TOOLS ###
    nvm # Node Version Manager - Simple bash script to manage multiple active node.js versions
    fasd # Productivity for the command line >> https://github.com/clvv/fasd#install
    tree
    htop
    wget
    cmake
    git
    gist # https://github.com/defunkt/gist
    git-lfs
    git-flow
    rename
    dockutil # Add/remove dock icons
    dark-mode # Set dark mode
    diff-so-fancy # used on .gitconfig [pager]
    bash-completion2
    wireshark
    ngrep

    zsh
    zsh-completions

    tmux
    tmuxinator-completion

    ### DATABASES ###
    redis
    # mongodb
    # postgresql
    homebrew/versions/postgresql95 --with-python
    postgresql95
    # apache-spark

    ### LANGUAGES ###
    # go
    ruby
    node
    python
    # python3

    automake
    libtool
    pango
    unp
    gdal

    ### Recent versions of some OS X tools. ###
    homebrew/dupes/grep
    # homebrew/dupes/openssh
    homebrew/dupes/screen

    ### COREUTILS ###
    coreutils # Install GNU core utilities (those that come with OS X are outdated).
    moreutils # Install some other useful utilities like `sponge`.
    findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.

)

# brew link --force openssl

brew install "${formulas[@]}"
brew cleanup # Remove outdated versions from the cellar.

# Put dark Mode
# force a specific mode
dark-mode --mode Dark
