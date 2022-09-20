# Dotfiles

Dependencies
------------
[ag](https://github.com/ggreer/the_silver_searcher)

[asdf-vm](https://github.com/asdf-vm/asdf)

[rust](https://www.rust-lang.org/tools/install)

[vundle](https://github.com/VundleVim/Vundle.vim#quick-start)

[purs for prompt highlighting](https://github.com/xcambar/purs)

[fzf](https://github.com/junegunn/fzf)

[neovim](https://neovim.io/)

[vim-plug](https://github.com/junegunn/vim-plug)

[rcm](https://github.com/thoughtbot/rcm) (or some other symlink manager)

[zsh](https://www.zsh.org/)

[zsh-completions](https://github.com/zsh-users/zsh-completions)

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)


Install
-------
Clone: `git clone git://github.com/amjacobowitz/dotfiles.git ~/dotfiles`

Install: `env RCRC=$HOME/dotfiles/rcrc rcup`

This will create symlinks for config files in your `$HOME` directory.

You can safely run `rcup` multiple times to update.

If your plugins aren't installed run `PlugInstall` after installing vim-plug.
