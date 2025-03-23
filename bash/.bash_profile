
# Load .profile if available 
if [ -f ~/.profile ]; then
	source ~/.profile
fi

# Load .bashrc if available
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# fastfetch
if command -v fastfetch &> /dev/null; then
        fastfetch
else
        echo "fastfetch command not found"
fi
