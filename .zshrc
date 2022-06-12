# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/jakob/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh//.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

export VISUAL=nvim
export EDITOR=nvim

# aliases
alias ls="ls --color=auto"
if hash exa 2> /dev/null; then
  alias ls="exa --icons"
  alias ll="ls -lh --git"
  alias la="ls -a"
  alias lla="ls -lha --git"
else
  alias ls="ls --color"
  alias ll="ls -l"
  alias la="ls -A"
  alias lla="ls-lA"
fi
alias q="exit"
alias clr="clear"
alias ..="cd .."

# Zinit
source /usr/share/zinit/zinit.zsh

# Zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit wait lucid light-mode for \
  OMZP::sudo

#zinit wait lucid light-mode for \
#  atinit"zicompinit; zicdreplay" \
#    zdharma-continuum/fast-syntax-highlighting \
#  atload"!_zsh_autosuggest_start" \
#    zsh-users/zsh-autosuggestions \
#  blockf atpull'zinit creinstall -q .' \
#    zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
