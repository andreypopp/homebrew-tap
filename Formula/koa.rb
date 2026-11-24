class Koa < Formula
  desc "Agent harness for ko"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/koa/0.3.7/koa-0.3.7.tar.gz"
  sha256 "07f3e8d33606baaf98afae169b24200ea39ab5df27e775092ad3dcf0cc10da46"
  version "0.3.7"
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
