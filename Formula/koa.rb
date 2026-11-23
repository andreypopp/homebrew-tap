class Koa < Formula
  desc "Agent harness for ko"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/koa/0.3.4/koa-0.3.4.tar.gz"
  sha256 "343035352ffe983c9662023683399d56e56a08b9f6ad121d3e21f4a24605412e"
  version "0.3.4"
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
