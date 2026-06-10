#!/usr/bin/env bash

set -e

VX_DIR="$HOME/.vx"
VX_FILE="$VX_DIR/vx.sh"
RAW_URL="https://raw.githubusercontent.com/nuhmanpk/vx/main/vx.sh"

echo "→ installing vx"

mkdir -p "$VX_DIR"

curl -fsSL "$RAW_URL" -o "$VX_FILE"

if [ -n "$ZSH_VERSION" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
    RC_FILE="$HOME/.zshrc"
else
    RC_FILE="$HOME/.bashrc"
fi

SOURCE_LINE='source ~/.vx/vx.sh'

touch "$RC_FILE"

if ! grep -Fxq "$SOURCE_LINE" "$RC_FILE"; then
    {
        echo ""
        echo "# vx"
        echo "$SOURCE_LINE"
    } >> "$RC_FILE"
fi

echo ""
echo "✓ installed vx"
echo "✓ config updated: $RC_FILE"
echo ""
echo "Next steps:"
echo "  source $RC_FILE"
echo "  vx"
