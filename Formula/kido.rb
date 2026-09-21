class Kido < Formula
  desc "Tmux sidebar for Claude Code sessions"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "6a1cf149c76b47242e7c98ea0d10d8c70e3e06fe"
  version "0.16.0"
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
      In ~/.tmux.conf:  source-file "#{opt_pkgshare}/kido-side.tmux"
      Then run  kido setup-claude  so Claude Code reports session status,
      and optionally  kido setup-zsh  for shell panes to report too.
    EOS
  end

  test do
    assert_match "must run inside tmux", shell_output("#{bin}/kido 2>&1", 1)
  end
end
