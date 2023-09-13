export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="k2gnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# fix xmodmap
xmodmap ~/.Xmodmap

# make enter behave like return
bindkey '^[OM' accept-line

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# k2 helper function for history search
function hist { grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} $1 $HOME/.zsh_history }
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
# Bob neovim version manager path
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
  export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
}
