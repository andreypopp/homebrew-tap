class Kow < Formula
  include Language::Python::Shebang

  desc "Manage a ko workspace server"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido/releases/download/kow/0.1.2/kow-0.1.2.tar.gz"
  sha256 "ed6e77b6dc256bd8c655066ecc8b90fd7f8dc6a6c3ef199ecc12a293092337f9"
  version "0.1.2"
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
