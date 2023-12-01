#! /usr/bin/env bash

# to override the default keybindings with ~/.config/mpv/input.conf

if alias mpv >/dev/null 2>&1; then
  alias mpv="/usr/bin/mpv --no-input-default-bindings"
fi

/usr/bin/mpv --no-input-default-bindings
