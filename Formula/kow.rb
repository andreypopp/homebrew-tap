class Kow < Formula
  include Language::Python::Shebang

  desc "Manage a ko workspace server"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/kow/0.1.1/kow-0.1.1.tar.gz"
  sha256 "6ce9401ad829cd8e5560c18cd6bb2cb4524748d2ef2ba5179e971ff643714ca1"
  version "0.1.1"
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
