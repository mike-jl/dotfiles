
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$(go env GOPATH)/bin
export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile

