class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.2/ko-0.7.2-darwin-arm64.tar.gz"
      sha256 "ed8a834af50e05f4f1e4239073ad58906164607f697802f179cf66d3cbbed1c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.2/ko-0.7.2-linux-arm64.tar.gz"
      sha256 "e5ae335636f45b5f070d69071ddd19a6136ca7af0019f67aa92a066b2fb77ac2"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.2/ko-0.7.2-linux-x86_64.tar.gz"
      sha256 "51ca0c348ae76fdaa8621f9331a839a370ff3fe7dc257a8897ecb75c97a554ae"
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
