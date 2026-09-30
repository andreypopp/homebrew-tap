# andreypopp/tap

```sh
brew install andreypopp/tap/kido   # tmux sidebar for Claude Code sessions
brew install andreypopp/tap/pi-coding-agent   # pi, ahead of homebrew-core
brew install andreypopp/tap/tmux   # tmux with the side status line kido runs in
```

`tmux` here shadows Homebrew's `tmux`; uninstall that one first
(`brew uninstall tmux`), or install with `brew install andreypopp/tap/tmux`
after `brew unlink tmux`.

`pi-coding-agent` here is homebrew-core's formula, bumped ahead of core.
If core's is installed, `brew uninstall pi-coding-agent` first.
