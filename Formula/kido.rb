class Kido < Formula
  desc "Tmux sidebar for Claude Code sessions"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "be2c5b6d7599d7b8c643d3681b6f0b33a2930844"
  version "0.1.1"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kido"
    bin.install "hooks/kido-hook.sh" => "kido-hook"
    pkgshare.install "tmux/kido-side.tmux", "hooks/settings-hooks.json"
  end

  def caveats
    <<~EOS
      Needs the tmux fork: brew install andreypopp/tap/tmux
      In ~/.tmux.conf:  source-file "#{opt_pkgshare}/kido-side.tmux"
      Merge #{opt_pkgshare}/settings-hooks.json into ~/.claude/settings.json
      so Claude Code reports session status to the sidebar.
    EOS
  end

  test do
    assert_match "must run inside tmux", shell_output("#{bin}/kido 2>&1", 1)
  end
end
