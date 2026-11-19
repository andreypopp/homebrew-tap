class Koa < Formula
  desc "Agent harness for ko"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/koa/0.2.0/koa-0.2.0.tar.gz"
  sha256 "f6757af76bb7342a07f525a5465d9be6364eed38ad2065fd6c00b23f5c764a1e"
  version "0.2.0"
  depends_on "node"
  depends_on "andreypopp/tap/pi-coding-agent"

  def install
    prefix.install "bin", "share"
  end

  def caveats
    <<~EOS
      koa runs in a pane of ko, from Kido.app or the ko or ko-bin formula.
    EOS
  end

  test do
    system bin/"koa", "--help", "--pi", "/nonexistent"
  end
end
