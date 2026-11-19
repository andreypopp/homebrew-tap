class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.1/ko-0.6.1-darwin-arm64.tar.gz"
      sha256 "51c4b184c5f9ad4e8c133c15ef7cc2cd63dcbf3cd04f83c5fe7dfdcd24aa6543"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.1/ko-0.6.1-linux-arm64.tar.gz"
      sha256 "8b2422ec28b3f77b028fbe7d9c2701b9059a47db20b1d57392b1d40697b5de3e"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.1/ko-0.6.1-linux-x86_64.tar.gz"
      sha256 "e6ad4a34e3ddac1a0cf7fdbf46d9d923c6692eaa4c44bee969aac44fbc2ebe6e"
    end
  end

  conflicts_with "ko", because: "both install the ko executables"

  def install
    prefix.install "bin", "share"
  end

  def caveats
    <<~EOS
      Install koa separately with brew install andreypopp/tap/koa.
    EOS
  end

  test do
    assert_equal "1.0", JSON.parse(shell_output("#{bin}/ko version")).fetch("protocol")
    system bin/"ko", "--help"
  end
end
