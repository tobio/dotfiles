#!/usr/bin/env bash

# Install homebrew
command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install fish
grep fish /etc/shells || sudo bash -c 'echo $(which fish) >> /etc/shells'
dscl . -read ~/ UserShell | grep fish || chsh -s $(which fish)

brew install hyper
brew install starship
brew install git
brew install gh
brew install jq
brew install vault
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask firefox
brew install --cask sublime-text
brew install --cask diffmerge
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask docker
brew install --cask keybase
brew install openvpn
brew install libtool
brew install automake
brew install autoconf
brew install --cask gpg-suite
brew install teleport

# Languages
brew install awscli
brew install tfenv
brew install golang
brew install --cask homebrew/cask-versions/adoptopenjdk8
brew install --cask intellij-idea-ce
tfenv install 0.11.10
brew install watchman

brew install asdf
echo -e "\nsource "(brew --prefix asdf)"/asdf.fish" >> ~/.config/fish/config.fish
source (brew --prefix asdf)/asdf.fish
asdf plugin add python
asdf plugin add nodejs

asdf install python latest
asdf install nodejs 12.22.1

# Slack
brew install --cask slack

# Mine
brew install --cask spotify
brew install --cask calibre
brew install --cask sizeup
brew install --cask vlc

# ECL
if [ "$1" == "--ecl-gh-token" ]; then
    export HOMEBREW_GITHUB_API_TOKEN=$2
    brew tap elastic/cloud-cli
#    brew tap elastic/soteria
    brew tap-pin elastic/cloud-cli
#    brew tap-pin elastic/soteria
    brew install elastic/cloud-cli/ecl
#    brew install elastic/soteria/soteria
fi

brew cleanup
