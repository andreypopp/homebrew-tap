class Tmux < Formula
  desc "Terminal multiplexer, with an interactive side status line (kido fork)"
  homepage "https://github.com/andreypopp/tmux"
  url "https://github.com/andreypopp/tmux.git",
      revision: "36f7ad64a6ddc703667ff5c1239d8b6f9a8c2a47"
  version "3.9-side.2"
  license "ISC"
  head "https://github.com/andreypopp/tmux.git", branch: "side-pane"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "libevent"
  depends_on "ncurses"
  depends_on "utf8proc"

  uses_from_macos "bison" => :build # for yacc

  on_macos do
    depends_on "jemalloc"
  end

  def install
    system "sh", "autogen.sh"

    args = %W[
      --enable-sixel
      --sysconfdir=#{etc}
      --enable-utf8proc
    ]
    args << "--with-TERM=screen-256color" if OS.mac? && MacOS.version < :sonoma

    system "./configure", *args, *std_configure_args
    system "make", "install"

    pkgshare.install "example_tmux.conf"
  end

  def caveats
    <<~EOS
      This is tmux master plus the side status line (tmux/tmux#5468) and
      side-status-command, used by kido: brew install andreypopp/tap/kido
    EOS
  end

  test do
    assert_match "next-3.9", shell_output("#{bin}/tmux -V")
    assert_match "side-status-command", shell_output("#{bin}/tmux -f /dev/null -L homebrew-test start-server \; show-options -g side-status-command \; kill-server")
  end
end
