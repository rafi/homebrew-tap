class Tmuxp < Formula
  include Language::Python::Virtualenv

  version "1.6.2"
  desc "tmux session manager built on libtmux"
  homepage "https://tmuxp.git-pull.com/"
  url "https://files.pythonhosted.org/packages/54/9e/ed1b701af53ac83ee5c4595acde5c7578a0052cf9fa014edc157c7b4d3e8/tmuxp-1.6.3.tar.gz"
  sha256 "4bc52d6683235307c92ddbb164c84e3e892ee2d00afa16ed89eca0fa7f85029e"
  head "https://github.com/tmux-python/tmuxp.git"

  depends_on "python"

  resource "click" do     # >=7<8
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "colorama" do  # >=0.3.9
    url "https://files.pythonhosted.org/packages/1f/bb/5d3246097ab77fa083a61bd8d3d527b7ae063c7d8e8671b1cf8c4ec10cbe/colorama-0.4.4.tar.gz"
    sha256 "5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b"
  end

  resource "kaptan" do    # >=0.5.10
    url "https://files.pythonhosted.org/packages/94/64/f492edfcac55d4748014b5c9f9a90497325df7d97a678c5d56443f881b7a/kaptan-0.5.12.tar.gz"
    sha256 "1abd1f56731422fce5af1acc28801677a51e56f5d3c3e8636db761ed143c3dd2"
  end

  resource "libtmux" do   # <0.9
    url "https://files.pythonhosted.org/packages/b0/43/4b66181475cb78be02e69a121e4f69d72aef7d2eb5855b23fa4ff13e055c/libtmux-0.8.5.tar.gz"
    sha256 "1d35b9f8451944d31c5ed22ed9e6c8e18034adcc75718fcc5b27fbd9621543e1"
  end

  resource "PyYAML" do    # >=3.13,<6
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
  end
end
