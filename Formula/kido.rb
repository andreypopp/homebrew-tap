class Kido < Formula
  desc "Tmux sidebar for Claude Code sessions"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "439fb0c1ca91b1ea5efd89b31b7a50a93b99a0943e452eaef55a092bc1befc98"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kido"
    bin.install "hooks/kido-hook.sh" => "kido-hook"
    pkgshare.install "tmux/kido.tmux", "tmux/kido-side.tmux", "hooks/settings-hooks.json"
  end

  def caveats
    <<~EOS
      tmux configs are in #{opt_pkgshare}: source kido-side.tmux with the
      patched tmux (brew install andreypopp/tap/tmux) or kido.tmux with a
      stock one. Merge settings-hooks.json into ~/.claude/settings.json so
      Claude Code reports session status to the sidebar.
    EOS
  end

  test do
    assert_match "must run inside tmux", shell_output("#{bin}/kido 2>&1", 1)
  end
end
