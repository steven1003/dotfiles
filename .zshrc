# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/$USER/bin:/home/$USER/.local/bin
alias vim=nvim

dotfiles() {
  /usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

_dotfiles() {
  if [[ $words[2] == add && $CURRENT -ge 3 ]]; then
    _files
  else
    local -x GIT_DIR="$HOME/.dotfiles"
    local -x GIT_WORK_TREE="$HOME"
    local service=git
    words[1]=git
    _git
  fi
}

compdef _dotfiles dotfiles

unsetopt CORRECT CORRECT_ALL
