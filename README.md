# my macos dotfiles

Dependencies and config for my MacOS development environment.

## overview

The repository's structure is overlaid on my `${HOME}` directory; thus,
[.config](.config) maps to the `${HOME}/.config` on my dev machine.

Highlights:

- dependencies installed with Brew -- see [.config/Brewfile](.config/Brewfile)
- [kitty](https://sw.kovidgoyal.net/kitty/) for terminal emulator -- see
  [.config/kitty](.config/kitty)
- bash (latest available version) for shell (not zsh) -- see [.bashrc](.bashrc)
- [nvim](https://neovim.io/) for CLI editor -- see [.config/nvim](.config/nvim)
- GPG keys stored on yubikey as described by
[https://github.com/drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)

I generally use Solarized for theming, which probably dates me to the wrong side
of 30, but such is life.

## installation

Installed from a bare git module inspired by
[this](https://www.atlassian.com/git/tutorials/dotfiles).

`curl -fsSL
https://raw.githubusercontent.com/jwilner/macos-dotfiles/main/bin/config |
bash -s -- sync`

This will (idempotently):

1. git clone the repo
1. checkout the worktree, positioning the files as appropriate (backing up any
conflicts),
1. set up git config
1. install Brew
1. Brew install all dependencies
1. register the upgraded version of bash and set the default shell to it

At this point you should probably switch to `kitty` from whatever terminal you
were using before.

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

Rather than explicitly installing languages with Brew, I use brew to install common
language environment management tools and leave configuring the language itself
for later.

Language environment managers:

- Python -> [pyenv](https://github.com/pyenv/pyenv)
- Rust -> [rustup-init](https://github.com/rust-lang/rustup/blob/master/rustup-init.sh)

Golang I just [download](https://go.dev/dl/) and use the
[built in management approach](https://go.dev/doc/manage-install).

## config management

`config` is mainly used as an alias to git for tracking any changes to dotfiles
-- e.g. `config add .bashrc`.

However, it has a few more useful commands in it

Run:

- `config switch-gpg-yubikey` -- switch gpg yubikey stubs
- `config brew dump --force` -- update [.Brewfile](.Brewfile)
- `config brew cleanup` -- remove anything not in [.Brewfile](.Brewfile)
