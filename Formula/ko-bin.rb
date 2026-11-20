class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.0/ko-0.7.0-darwin-arm64.tar.gz"
      sha256 "3b35c3256273b17d7fba94ad88a296eac3990319b397b741157aa5bdfb80d10e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.0/ko-0.7.0-linux-arm64.tar.gz"
      sha256 "be6b27e2bd97888e2c3fe0cd40206dad6f8389d3aa95f69051bdd7c15eb99563"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.7.0/ko-0.7.0-linux-x86_64.tar.gz"
      sha256 "7ecbd97278a4707b3700450f9b792b602c2287efd78a505655184f6bccdf23da"
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
