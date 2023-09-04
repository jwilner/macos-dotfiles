# my macos dotfiles

Mainly brew and vim dependencies for my development environment. See [.Brewfile](.Brewfile).

## installation

Installed from a bare git module as described [here](https://www.atlassian.com/git/tutorials/dotfiles).

```shell
$ git clone --bare https://github.com/jwilner/macos-dotfiles.git "${HOME}"/.cfg
$ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
$ config checkout  # might need to resolve conflicts with preexisting .bashrc etc
$ config --local status.showUntrackedFiles no  # ignore untracked files
$ config submodule init && config submodule update  # download submodules (vim packages)
$ command -v brew > /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle install --global  # use global Brewfile just checked out
```

Rather than explicitly installing languages with Brew, I use brew to install common language environment management tools and leave configuring the language itself for later.

Language environment managers:
- Python -> [pyenv](https://github.com/pyenv/pyenv)
- Rust -> [rustup-init](https://github.com/rust-lang/rustup/blob/master/rustup-init.sh)

Golang I just [download](https://go.dev/dl/) and use the [built in management approach](https://go.dev/doc/manage-install).

