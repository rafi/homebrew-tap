class Tmuxp < Formula
  include Language::Python::Virtualenv

  desc "tmux session manager. built on libtmux"
  homepage "https://tmuxp.git-pull.com/"
  url "https://files.pythonhosted.org/packages/d8/97/7500aa25aa4ab80b67666fd5026e990bbe78cf6eff644d31483c7561ef94/tmuxp-1.4.2.tar.gz"
  sha256 "b5895a6341729b4c712f03657c6d7e519bf0e32a8f8411dc28aee160c365f120"
  head "https://github.com/tmux-python/tmuxp.git"

  depends_on "python"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz"
    sha256 "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"
    sha256 "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
  end

  resource "kaptan" do
    url "https://files.pythonhosted.org/packages/52/1f/1faa2c65aabaf685725586fc2c19b3b8bc70d2aa0eea39d480d2e4a55077/kaptan-0.5.10.tar.gz"
    sha256 "44df200d030975650a3a832c13b48cafdeb1a237b23de181d6a2346107e39da3"
  end

  resource "libtmux" do
    url "https://files.pythonhosted.org/packages/6b/70/dd9674764ec3a7e78e7bdba8b6ec812f44058418aea0aa1d4e02327e943f/libtmux-0.8.0.tar.gz"
    sha256 "2b969b507c26d9db08b85be4808d75774b6418ecf5a0f61956f7a1da44519585"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz"
    sha256 "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
  end
end
