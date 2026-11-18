class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.1/ko-0.5.1-darwin-arm64.tar.gz"
      sha256 "523be527f774579f6e7ac2b7223a81abc26746dc6f32fe861f43401f616a33e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.1/ko-0.5.1-linux-arm64.tar.gz"
      sha256 "e096e65dbbe40d469cccb88c8c4d266bdc3ee0b5a67437679e900053d5f4253e"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.1/ko-0.5.1-linux-x86_64.tar.gz"
      sha256 "8622d4d366eb906d1e5d38b80c082949e81cab4edeba5244538ffa4e6105205e"
    end
  end

  conflicts_with "ko", because: "both install the ko executables"

  def install
    prefix.install "bin", "share"
  end

  def caveats
    <<~EOS
      This is the ko CLI and server for terminals and remote hosts, prebuilt.
      Kido.app bundles its own ko. koa needs Node 24 and pi on PATH.
    EOS
  end

  test do
    assert_equal "1.0", JSON.parse(shell_output("#{bin}/ko version")).fetch("protocol")
    system bin/"ko", "--help"
  end
end
