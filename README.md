# my macos dotfiles

Dependencies and config for my MacOS development environment. Uses [kitty](https://sw.kovidgoyal.net/kitty/) as the terminal emulator. Aggressively updated with dependabot.

Points of interest:

- [.Brewfile](.Brewfile)
- [.vimrc](.vimrc)
- [.vim/](.vim/)
- [.gitconfig](.gitconfig)

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

At this point you should probably switch to `kitty` from whatever terminal you were using before.

### follow up: change system shell

Use the modern version of bash that was just installed: `chsh -s /usr/local/bin/bash`.

### follow up: gitconfig overrides

Set up a specific work email for git.

```shell
$ cat <<EOF > .gitconfig.overrides 
[user]
    email = me@workemail.com
EOF
```

### follow up: generate an ssh key

Usually need this for one reason or another and will then be managed by [funtoo keychain](https://www.funtoo.org/Funtoo:Keychain).

```shell
$ ssh-keygen -t ed25519 -C "me@workemail.com"
```

### follow up: language envs

Rather than explicitly installing languages with Brew, I use brew to install common language environment management tools and leave configuring the language itself for later.

Language environment managers:
- Python -> [pyenv](https://github.com/pyenv/pyenv)
- Rust -> [rustup-init](https://github.com/rust-lang/rustup/blob/master/rustup-init.sh)

Golang I just [download](https://go.dev/dl/) and use the [built in management approach](https://go.dev/doc/manage-install).

## config management

- Update .Brewfile with `brew bundle dump --global --force --describe`
