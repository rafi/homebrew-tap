class Tmuxp < Formula
  include Language::Python::Virtualenv

  desc "tmux session manager. built on libtmux"
  homepage "https://tmuxp.git-pull.com/"
  url "https://files.pythonhosted.org/packages/20/ac/91b7a3286237b717d850fc09a8973ff9bb8ad678bf16aa0dc74b3b659289/tmuxp-1.5.5.tar.gz"
  sha256 "cd9724b2738a3032f29784ce2e37332ca5f80104e05182502dcdadf7b08f7fc9"
  head "https://github.com/tmux-python/tmuxp.git"

  depends_on "python"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "kaptan" do
    url "https://files.pythonhosted.org/packages/94/64/f492edfcac55d4748014b5c9f9a90497325df7d97a678c5d56443f881b7a/kaptan-0.5.12.tar.gz"
    sha256 "1abd1f56731422fce5af1acc28801677a51e56f5d3c3e8636db761ed143c3dd2"
  end

  resource "libtmux" do
    url "https://files.pythonhosted.org/packages/17/4e/8ead5b24584c66c8f430ad695024f1fb37985d9119db925c5e5e083cd869/libtmux-0.8.3.tar.gz"
    sha256 "a4c7379604ccdc684aa865723211184709f9a2b45511772989b5f26ad156650e"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d/colorama-0.4.3.tar.gz"
    sha256 "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
  end
end
