export VISUAL="nvim"
export EDITOR=$VISUAL

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF features
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}
# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

# Prompt to reflect git status
autoload -U promptinit; promptinit
prompt pure

export PGHOST=localhost

#Private Github All Access Token
export GITHUB_TOKEN=304ea71fce41bc33c979da4ae0abb1f9bec53afb

#Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export PATH=$PATH:/usr/java/jdk1.8.0_131/bin

# PrinceXML
export PATH=/usr/local/prince10/bin:$PATH

# Make bin of trusted rails apps part of path
export PATH=.git/safe/../../bin:$PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Useful aliases
cd() { builtin cd "$@"; ls -AFCG;}

alias e="exit"

# Git aliases
alias gp="git pull"
alias gpo="git push origin"
alias gk="git checkout"
alias gkb="git checkout -b"
alias gaa="git add ."
alias gc="git commit -m"
alias gs="git status"
alias gb="git branch -vv"
alias gd="git diff"
alias grt="git rebase -i trunk"
alias gpt="git push origin trunk"


# Rails aliases
alias be="bundle exec"
alias migrate="bundle exec rails db:migrate db:rollback && bundle exec rails db:migrate db:test:prepare"
alias dbsetup="bundle exec rails db:drop && bundle exec rails db:create && bundle exec rails db:schema:load && bundle exec rails db:migrate && bundle exec rails db:seed"
alias rs="passenger start"
alias rc="rails console"
alias restore="development restore production"

# RSpec
alias rof="rspec --only-failures"
alias rnf="rspec spec --exclude-pattern 'spec/{features}/**/*_spec.rb'"

# Jest Testing
alias jc="node --inspect-brk node_modules/.bin/jest --runInBand"
alias j="yarn jest --watch"

# Postgresql
alias pgstart="brew services start postgresql@10"
alias pgstop="brew services stop postgresql@10"

# Other aliases
alias ess="brew services start elasticsearch"
alias ..="cd .."

# Neovim
alias linkvim="ln -s ~/.vim ~/.config/nvim"
alias linkvimrc="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias v="nvim"

# Heroku aliases
alias hc="heroku run rails c -r"
alias ht="heroku logs -t -r"

# asdf
export NODEJS_CHECK_SIGNATURES=no
. $HOME/.asdf/asdf.sh

autoload -Uz compinit && compinit

fpath=(/Users/amjacobowitz/.asdf/completions /usr/local/share/zsh-completions /usr/local/share/zsh/site-functions /usr/local/Cellar/zsh/5.8/share/zsh/functions)

flip() {
  if [ "$#" -ne 3 ]; then
    echo 'You must provide 3 arguments and 3rd argument must be a string';
  else
    perl -pi -w -e "s/$1/$2/g;" $3
  fi
}

fpath=(/usr/local/share/zsh-completions $fpath)

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Maintain shell history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# added by Anaconda2 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda2/etc/profile.d/conda.sh" ]; then
# . "/anaconda2/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# added by Miniconda2 installer
export PATH="/Users/amjacobowitz/miniconda2/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/amjacobowitz/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/amjacobowitz/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/amjacobowitz/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/amjacobowitz/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

