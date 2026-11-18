class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.0/ko-0.5.0-darwin-arm64.tar.gz"
      sha256 "b30e6d1b49e04fc54c7ec081faad26580ecbaf91ca1b7c938688eeec25310a4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.0/ko-0.5.0-linux-arm64.tar.gz"
      sha256 "5f423e698774c0d959d255531f66733fb15ac448a1439206281455de408f63b8"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.5.0/ko-0.5.0-linux-x86_64.tar.gz"
      sha256 "8c793ea61b74058f0c280953a53209506ba2f07fe9aaa3fdc5c3bfa99206911a"
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
