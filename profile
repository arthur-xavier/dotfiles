# vim: ft=sh:fdm=marker:fdl=0:
export DOTFILES=$HOME/Workspace/dotfiles
export EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# $PATH {{{
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin:$PATH"
# Local binaries
export PATH="$PATH:$HOME/.bin"
# Python
export PATH="~/Library/Python/3.6/bin:$PATH"
# }}}

# Android SDK {{{
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:$PATH
# }}}

# NVM {{{
export NVM_DIR="/Users/xavier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# }}}

# RVM {{{
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# }}}

# FZF {{{
export FZF_DEFAULT_COMMAND='
  (git ls-files ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
# }}}

# Google Cloud SDK {{{
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luis/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/luis/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/luis/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/luis/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# }}}

# COLORFGBG {{{
colorfgbg() {
  stty -echo
  if [ -n "$TMUX" ]; then
    echo -ne '\033Ptmux;\e\e]10;?\a\e\e]11;?\a\033\\'
  else
    echo -ne '\e]10;?\a\e]11;?\a'
  fi
  IFS=: read -t 0.1 -d $'\a' x fg
  IFS=: read -t 0.1 -d $'\a' x bg
  if [[ ${fg:0:1} =~ [01234567] ]]; then
    [[ -n "$TMUX" ]] && tmux set-environment COLORFGBG "0;15"
    export COLORFGBG='0;15'
  else
    [[ -n "$TMUX" ]] && tmux set-environment COLORFGBG "15;0"
    export COLORFGBG='15;0'
  fi
  unset x fg bg
  stty echo
}
# }}}

# iTerm2 color profiles {{{
profile() {
  if [ -n "$TMUX" ]; then
    echo -ne "\033Ptmux;\033\033]50;SetProfile=$1\a\033\\"
  else
    echo -ne "\033]50;SetProfile=$1\a"
  fi
  colorfgbg
}

light() {
  profile light
}

dark() {
  profile dark
}
# }}}

source ~/.aliases
source ~/.local_profile

colorfgbg
[[ ! -n "$TMUX" ]] && tmux

export PATH="$HOME/.cargo/bin:$PATH"
