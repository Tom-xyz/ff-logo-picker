# ff-logo-picker

> Interactive picker for [fastfetch](https://github.com/fastfetch-cli/fastfetch) ASCII logos — fuzzy-search, live-preview, one-keystroke apply.

![demo](docs/demo.gif)

## Why

fastfetch ships ~500 built-in ASCII logos. The official way to browse them is `fastfetch --print-logos`, which **dumps every logo and overflows the terminal scrollback** — useless for actually choosing one.

`fflogo` is a thin client over your installed fastfetch: it lists the names via `fastfetch --list-logos`, drops them into an `fzf` picker, and renders each one **live** in the preview pane (with your real system stats next to it). On `Enter`, your fastfetch config is updated.

No logos are bundled. fastfetch updates flow through automatically.

## Install

```sh
brew install tom-xyz/tap/fflogo
```

`fastfetch` and `fzf` are installed as dependencies.

## Usage

```sh
fflogo            # open the picker
fflogo --random   # apply a random logo, no prompt
fflogo --print    # pick, print the name to stdout, don't modify config
```

## Run on every new terminal

Add to your shell rc (`~/.zshrc`, `~/.bashrc`, `~/.config/fish/config.fish`):

```sh
fastfetch
```

For tmux/Ghostty/iTerm splits where the banner re-fires on every pane, throttle it:

```sh
fflogo-banner() {
  local m=/tmp/.fflogo-banner-$UID
  if [[ -f $m ]] && (( $(date +%s) - $(stat -f %m "$m" 2>/dev/null || stat -c %Y "$m" 2>/dev/null || echo 0) < 3 )); then
    return
  fi
  touch "$m"; fastfetch
}
[[ $- == *i* ]] && fflogo-banner
```

## Uninstall

```sh
brew uninstall fflogo
```

## License

[MIT](LICENSE)
