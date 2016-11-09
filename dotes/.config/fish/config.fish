set fish_greeting ''

# Path to Oh My Fish install.
set -q XDG_DATA_HOME and set -gx OMF_PATH "$XDG_DATA_HOME/omf" or set -gx OMF_PATH "$HOME/.local/share/omf"

set BROWSER chromium
set EDITOR nano
set VISUAL code
set -g -x PATH $PATH ~/bin
set -g -x PATH $PATH ~/npm/bin
set -g -x PATH $PATH ~/.npm-global/bin

set -x LESS "-XMcifR"
set -x TZ "Europe/London"

if test "$XDG_VTNR" -eq 2
    set XDG_VTNR
    exec startx
else
    tmux-auto
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

if [ -f ~/.local/config.fish ]
  source ~/.local/config.fish
end

if test -e ~/.local/.profile
    source ~/.local/.profile
end

if test -e ~/.local/.aliases
    source ~/.local/.aliases
end

if test -e ~/.local/.exports
    source ~/.local/.exports
end