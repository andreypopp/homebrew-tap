class Kido < Formula
  desc "Tmux sidebar for Claude Code sessions"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "3e53111f59eefba6355e7d78f62b271730e4a291"
  version "0.21.1"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kido"
    pkgshare.install "tmux/kido-side.tmux"
    pkgshare.install "shell"
  end

  def caveats
    <<~EOS
      Needs the tmux fork: brew install andreypopp/tap/tmux
      Then:  kido setup-tmux     loads the sidebar config
             kido setup-claude   so Claude Code reports session status
             kido setup-zsh      optional, for shell panes to report too
    EOS
  end

  test do
    assert_match "must run inside tmux", shell_output("#{bin}/kido 2>&1", 1)
  end
end
