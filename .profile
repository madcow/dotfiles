# Source .bashrc if bash exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Add local folders to PATH if they exist:
# $HOME/bin/ and $HOME/.local/bin/

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
