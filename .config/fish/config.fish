set --export SHELL /usr/bin/fish
set --export EDITOR "nvim"
set --export PATH "$PATH $HOME/.scripts/"
set fish_greeting ""

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"
