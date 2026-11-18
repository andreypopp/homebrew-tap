class KoBin < Formula
  desc "Terminal multiplexer CLI and server (prebuilt binaries)"
  homepage "https://github.com/andreypopp/kido"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.0/ko-0.6.0-darwin-arm64.tar.gz"
      sha256 "d748201c313cbdce0ba321d84957d006e51fc438202d61febb67266f7f9910f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.0/ko-0.6.0-linux-arm64.tar.gz"
      sha256 "67cda2270cc8d1fd2d447df2549ed83ad65353d3694eab7f9ea98f7906365865"
    end
    on_intel do
      url "https://github.com/andreypopp/kido/releases/download/ko/0.6.0/ko-0.6.0-linux-x86_64.tar.gz"
      sha256 "05eb7e9f0fa2b90b000e09cbbf7ec1c2dcbc605c546b0c3ff76d9ce96a26c413"
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
