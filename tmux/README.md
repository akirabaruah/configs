# Tmux

Create a symlink like this:

```sh
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
```

## terminfo

See https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95

Run this command to download latest ncurses terminfo definitions:

``` sh
curl -L https://invisible-island.net/datafiles/current/terminfo.src.gz | gunzip > terminfo.src
```

Then install the `tmux-256color` profile:

``` sh
tic -xe tmux-256color terminfo.src
```
