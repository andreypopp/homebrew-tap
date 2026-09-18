class Kido < Formula
  desc "Tmux sidebar for Claude Code sessions"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "9b70400887db18a88869cac7b1b922921636ddff"
  version "0.2.1"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kido"
    pkgshare.install "tmux/kido-side.tmux"
  end

  def caveats
    <<~EOS
      Needs the tmux fork: brew install andreypopp/tap/tmux
      In ~/.tmux.conf:  source-file "#{opt_pkgshare}/kido-side.tmux"
      Then run  so Claude Code reports session status.
    EOS
  end

  test do
    assert_match "must run inside tmux", shell_output("#{bin}/kido 2>&1", 1)
  end
end
