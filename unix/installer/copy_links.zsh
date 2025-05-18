#! /bin/zsh

SCRIPT_DIR="$(cd "$(dirname "${(%):-%N}")" && pwd)"
DOT_CONFIG_DIR="$(realpath "$SCRIPT_DIR/../dot_config")"

for ITEM in "$DOT_CONFIG_DIR"/*; do
    BASENAME="$(basename "$ITEM")"
    TARGET="$HOME/.config/$BASENAME"

    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        echo "Skipping existing: $TARGET"
        continue
    fi

    ln -s "$ITEM" "$TARGET"
    echo "Linked: $ITEM -> $TARGET"
done
