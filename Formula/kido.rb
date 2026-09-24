class Kido < Formula
  desc "Terminal multiplexer for coding agent sessions: tmux with a live side column"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "b9c2099d61dab1e7d80f0a9e8576d264f4d33dbb"
  version "0.25.0"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "go" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "libevent"
  depends_on "ncurses"
  depends_on "utf8proc"

  uses_from_macos "bison" => :build

  # kido runs only under the andreypopp/tmux fork (side status column,
  # tmux/tmux#5468, plus side-status-command and OSC 133 command-line
  # capture). The fork is the git submodule third_party/tmux, pinned by the
  # kido revision above, and scripts/install-tmux-fork.sh builds it into
  # bin/kido-tmux, which is what CI builds and tests against. It never
  # shadows a stock tmux: kido starts its server on its own socket.
  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kido"
    system "sh", "scripts/install-tmux-fork.sh", prefix
    mv man1/"tmux.1", man1/"kido-tmux.1"
    system "sh", "scripts/install-share.sh", pkgshare
  end

  def caveats
    <<~EOS
      Run `kido` from a plain terminal. Nothing else to set up: it starts
      its own tmux (kido-tmux) on its own socket, and Claude Code and pi
      report to the sidebar when started inside it.

      Upgrading from a kido that needed `kido setup-*`: those commands and
      the tap's tmux formula are gone. `brew uninstall andreypopp/tap/tmux`
      and see README, "Upgrading from the setup-command era".
    EOS
  end

  test do
    assert_match "next-3.9", shell_output("#{bin}/kido-tmux -V")
    assert_match "side-status-command",
      shell_output("#{bin}/kido-tmux -f /dev/null -L homebrew-test start-server \\; show-options -g side-status-command \\; kill-server")
    assert_match "already inside tmux", shell_output("TMUX=x #{bin}/kido 2>&1", 1)
  end
end
