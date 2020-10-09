if [[ -d $DOTFILES/zsh/functions ]]; then
    for func in $DOTFILES/zsh/functions/*(:t); autoload -U $func
fi

prepend_path /usr/local/sbin
prepend_path $DOTFILES/bin
prepend_path $HOME/bin
prepend_path $HOME/usr/bin
prepend_path $HOME/usr/local/bin
prepend_path $HOME/.local/bin
prepend_path $HOME/.cargo/bin

if [[ "$(uname)" == "Linux" ]]; then
    export LD_LIBRARY_PATH=usr/lib/x86_64-linux-gnu
fi

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

if [ ! -f $HOME/.antigen.zsh ]; then
    curl -L git.io/antigen > $HOME/.antigen.zsh
fi

source $HOME/.antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle DarrinTisdale/zsh-aliases-exa
antigen bundle z
antigen bundle mafredri/zsh-async
antigen bundle psprint/zsh-navigation-tools
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle chrissicool/zsh-256color
antigen bundle sindresorhus/pure

#zstyle :prompt:pure:path color white
zstyle :prompt:pure:git:branch:cached color default
zstyle :prompt:pure:git:branch color green

antigen apply


bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
bindkey "^A" vi-beginning-of-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt PROMPT_SUBST

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS


alias vim=nvim
alias reload!='source ~/.zshrc'
alias lpath='echo $PATH | tr ":" "\n"' # list the PATH separated by new lines

if [[ "$(uname)" == "Linux" ]]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
    export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
    export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew";
    prepend_path "$HOMEBREW_PREFIX/bin"
    prepend_path "$HOMEBREW_PREFIX/sbin"
    export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH}";

    eval $($HOME/.linuxbrew/bin/brew shellenv)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.profile
