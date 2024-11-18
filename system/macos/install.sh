# Current file and directory
FILE=$(realpath "$0")
DIR=$(dirname "$FILE")

# Make a bin directory
mkdir bin
echo "terminal-life/system/macos"
echo "export PATH=\"\$PATH:$DIR/bin\"" >> ~/.zshrc

# toggle_fullscreen_iterm
ln -s "$DIR"/toggle_fullscreen_iterm.sh "$DIR"/bin/tf
