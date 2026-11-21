class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.1/ko-0.7.1-darwin-arm64.tar.gz"
      sha256 "c8c0ce0f4b2ba7e5490fd3cfe438defda674ade934bd62ab6efa647cc8483412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.1/ko-0.7.1-linux-arm64.tar.gz"
      sha256 "85a5331cfdc14b4b2280e7639edc99b018ad82b0a8f413166e9d5d1920fe7a4f"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.1/ko-0.7.1-linux-x86_64.tar.gz"
      sha256 "0c44ea6b3ee848482d60bac8e9579c4ad04e78d6be6c6349c23d82d6cc396ff0"
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
