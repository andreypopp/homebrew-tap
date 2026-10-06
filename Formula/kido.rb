class Kido < Formula
  desc "Terminal multiplexer for coding agent sessions: tmux with a live side column"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "8538a9636b3d8df9fc884c246e4bfae6fb66fc25"
  version "0.39.1"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "dune" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "libevent"
  depends_on "ncurses"
  depends_on "utf8proc"

  uses_from_macos "bison" => :build

  # kido runs only under the andreypopp/tmux fork (side status column,
  # tmux/tmux#5468, plus side-status-command and OSC 133 command-line
  # capture). The fork is the git submodule third_party/tmux, pinned by the
  # kido revision above, and `make install` builds it into bin/kido-tmux
  # via scripts/install-tmux-fork.sh, which is what CI builds and tests
  # against. It never shadows a stock tmux: kido starts its server on its
  # own socket, and both the binary and its man page are installed as
  # kido-tmux/kido-tmux.1.
  #
  # kido itself is OCaml built with dune package management: dune.lock pins
  # the compiler and every library, and dune downloads and builds them
  # itself, so the build needs network access. Its cache lives in
  # HOMEBREW_CACHE, since the sandbox may not write to HOME, so a release
  # that keeps dune.lock rebuilds only kido. It copies rather than
  # hardlinks: the sandbox grants the build's tmpdir network access
  # (sandbox.rb, allow_network path: tmpdir), and macOS then refuses a
  # hardlink into it from a less privileged path (forbidden-link-priv),
  # which dune counts as a cache miss.
  def install
    ENV["DUNE_CACHE_ROOT"] = HOMEBREW_CACHE/"dune"
    ENV["DUNE_CACHE_STORAGE_MODE"] = "copy"
    system "make", "install", "PREFIX=#{prefix}"
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
    tmux = "#{bin}/kido-tmux -f /dev/null -S #{testpath}/tmux.sock"
    assert_match "side-status-command",
      shell_output("#{tmux} start-server \\; show-options -g side-status-command \\; kill-server")
    assert_match "already inside tmux", shell_output("TMUX=x #{bin}/kido 2>&1", 1)
  end
end
