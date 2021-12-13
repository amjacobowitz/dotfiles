export VISUAL="nvim"
export EDITOR=$VISUAL

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# FZF features
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}
# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

export PGHOST=localhost

#Private Github All Access Token
export GITHUB_TOKEN=304ea71fce41bc33c979da4ae0abb1f9bec53afb

# Make bin of trusted rails apps part of path
export PATH=.git/safe/../../bin:$PATH

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
alias rssl="puma -b 'ssl://localhost:9292'"

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
alias ess="brew services start elasticsearch-full"
alias ..="cd .."

# Neovim
alias linkvim="ln -s ~/.vim ~/.config/nvim"
alias linkvimrc="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias v="nvim"

# Heroku aliases
alias hc="heroku run rails c -r"
alias ht="heroku logs -t -r"

# Python aliases
alias pt="python3 RavensProject.py; cat ProblemResults.csv"

# asdf
export NODEJS_CHECK_SIGNATURES=no
. /opt/homebrew/opt/asdf/libexec/asdf.sh

autoload -Uz compinit && compinit

# Completions
fpath=(${ASDF_DIR}/completions $fpath)

# Syntax highlighting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Maintain shell history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Prompt to reflect git status
function zle-line-init zle-keymap-select {
  PROMPT=`/Users/aaronjacobowitz/rust/purs/target/release/purs prompt -k "$KEYMAP" -r "$?" --venv "${${VIRTUAL_ENV:t}%-*}"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  /Users/aaronjacobowitz/rust/purs/target/release/purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd
