#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Music Player
# @raycast.mode compact
# @raycast.packageName SuperCmd Scripts

# Optional parameters:
# @raycast.needsConfirmation false
export PATH="/opt/homebrew/bin:/usr/local/bin:/Applications/Ghostty.app/Contents/MacOS:$PATH"
if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi
ghostty  --title="Termusic Player" --working-directory=~/Media/Music -e termusic
