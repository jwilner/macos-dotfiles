# my macos dotfiles

Dependencies and config for my MacOS development environment. Aggressively updated with dependabot.

High level choices:

- [kitty](https://sw.kovidgoyal.net/kitty/) for terminal emulator
- bash (latest available version) for shell (not zsh)
- vim for CLI editor

I do more involved development in the suite of Jetbrains IDEs, which I install via the [Jetbrains
Toolbox](https://www.jetbrains.com/toolbox-app/) and configure out-of-band via the [Settings Sync
Plugin](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync).

I generally use Solarized for theming, which probably dates me to the wrong side of 30, but such is life.

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

Optionally, set up a specific work email for git.

```shell
$ cat <<EOF > .gitconfig.overrides
[user]
    email = me@workemail.com
EOF
```

### follow up: GPG

Insert yubikey and then:

```shell
$ gpg --edit-card
gpg/card> fetch
...
gpg/card> quit

$ gpg --edit-key
gpg> trust
Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
gpg> quit
```

### follow up: language envs

Rather than explicitly installing languages with Brew, I use brew to install common language environment management tools and leave configuring the language itself for later.

Language environment managers:
- Python -> [pyenv](https://github.com/pyenv/pyenv)
- Rust -> [rustup-init](https://github.com/rust-lang/rustup/blob/master/rustup-init.sh)

Golang I just [download](https://go.dev/dl/) and use the [built in management approach](https://go.dev/doc/manage-install).

## config management

`brew bundle` is primed with appropriate args under `config brew`.

Run:
- `config brew install`
- `config brew dump --force` -- update [.Brewfile](.Brewfile)
- `config brew cleanup` -- remove anything not in [.Brewfile](.Brewfile)
