
# https://www.freecodecamp.org/chinese/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro/
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
# MacPorts Installer addition on 2022-11-02_at_11:06:26: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:~/bin/arcanist/bin:$PATH"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:~/bin/arcanist/bin:~/.foundry/bin:/opt/homebrew/bin:/opt/local/bin:/opt/local/sbin"
# Finished adapting your PATH environment variable for use with MacPorts.

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
#export MY_SETTING=1
#[[ -e ~/.profile ]] && emulate sh -c 'source /Users/will/.xmrc'
source /Users/will/.xmrc
source /Users/will/exportPATH
