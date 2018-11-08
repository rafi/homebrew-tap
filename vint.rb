class Vint < Formula
  include Language::Python::Virtualenv

  desc "Fast and Highly Extensible Vim script Language Lint implemented in Python"
  homepage "https://github.com/Kuniwak/vint"
  url "https://files.pythonhosted.org/packages/6e/16/980fdd8007889d48dfb18e71731890a06d6841a7fab95dc27debb44a74c1/vim-vint-0.3.19.tar.gz"
  sha256 "aba8938f4c720e5c70a25f4dc7d845c5ce87aba0b778d1686f18b8da0c88f234"
  head "https://github.com/Kuniwak/vint.git"

  depends_on "python"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz"
    sha256 "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
  end

  resource "ansicolor" do
    url "https://files.pythonhosted.org/packages/e0/00/90593d0c3078760bc3ed530f3be381c16329e80a2b47b8e6230c1288ff77/ansicolor-0.2.6.tar.gz"
    sha256 "d17e1b07b9dd7ded31699fbca53ae6cd373584f9b6dcbc124d1f321ebad31f1d"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
  end
end
