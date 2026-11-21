class Kow < Formula
  include Language::Python::Shebang

  desc "Manage a ko workspace server"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/kow/0.1.0/kow-0.1.0.tar.gz"
  sha256 "5771129aacec4b476a442549ac5582e4ab08a52223df4fa7c5a5a248b2c5c778"
  version "0.1.0"
  depends_on "python"
  depends_on "opentofu"

  def install
    bin.install "kow"
    rewrite_shebang detected_python_shebang, bin/"kow"
  end

  test do
    system bin/"kow", "--help"
  end
end
