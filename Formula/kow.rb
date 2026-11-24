class Kow < Formula
  include Language::Python::Shebang

  desc "Manage a ko workspace server"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/kow/0.1.3/kow-0.1.3.tar.gz"
  sha256 "fc063e1b09ebaae48ae30eb17d42f201439657d25bcb95a6be458b64910b12e1"
  version "0.1.3"
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
