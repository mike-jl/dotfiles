
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=~/bin:$PATH:$(go env GOPATH)/bin
export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile
export PICO_SDK_PATH=~/src/pico-sdk
