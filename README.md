# my macos dotfiles

Dependencies and config for my MacOS development environment.

High level choices:

- [kitty](https://sw.kovidgoyal.net/kitty/) for terminal emulator
- bash (latest available version) for shell (not zsh)
- [nvim](https://neovim.io/) for CLI editor configured with a number of [LSPs](.config/nvim/conf/lsps)

I do more involved development in the suite of Jetbrains IDEs, which I install via the [Jetbrains
Toolbox](https://www.jetbrains.com/toolbox-app/) and configure out-of-band via the [Settings Sync
Plugin](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync).

I generally use Solarized for theming, which probably dates me to the wrong side of 30, but such is life.

## installation

Installed from a bare git module inspired by [this](https://www.atlassian.com/git/tutorials/dotfiles).

```shell
$ bash -s "$(curl -fsSL https://raw.githubusercontent.com/jwilner/macos-dotfiles/main/bin/sync)" -- sync
```

This will (idempotently):

- git clone the repo
- checkout the worktree, positioning the files as appropriate (backing up any conflicts), 
- set up git config
- install Brew
- Brew install all dependencies
- register the upgraded version of bash and set the default shell to it

At this point you should probably switch to `kitty` from whatever terminal you were using before.

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

`config` is mainly used as an alias to git for tracking any changes to dotfiles -- e.g. `config add .bashrc`.

However, it has a few more useful commands in it

Run:
- `config switch-gpg-yubikey` -- switch gpg yubikey stubs
- `config brew dump --force` -- update [.Brewfile](.Brewfile)
- `config brew cleanup` -- remove anything not in [.Brewfile](.Brewfile)
