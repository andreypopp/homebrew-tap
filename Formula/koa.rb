class Koa < Formula
  desc "Agent harness for ko"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/koa/0.3.1/koa-0.3.1.tar.gz"
  sha256 "87451dc0acdbc6d2ff8adc63b0ce417e9e646b4b632e4f7cd4e42d87bb403069"
  version "0.3.1"
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
