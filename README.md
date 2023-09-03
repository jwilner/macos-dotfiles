# my macos dotfiles

Mainly brew and vim dependencies for my development environment. See [.Brewfile](.Brewfile).

## installation

Installed from a bare git module as described [here](https://www.atlassian.com/git/tutorials/dotfiles).

- Clone bare repo to a subdir: `git clone --bare https://github.com/jwilner/macos-dotfiles.git "${HOME}"/.cfg`
- Define helper alias: `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
- Checkout config `config checkout` (might need to resolve conflicts)
- Ignore untracked files: `config config --local status.showUntrackedFiles no`
- Download submodules (mainly vim packages): `config submodule init && config submodule update`
- Install `brew`: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install `brew` managed dependencies: `brew bundle install --global`
