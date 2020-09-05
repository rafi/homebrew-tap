class Vint < Formula
  include Language::Python::Virtualenv

  version "0.4a4"
  desc "Vim script lint implemented in python"
  homepage "https://github.com/Kuniwak/vint"
  head "https://github.com/Kuniwak/vint.git"
  url "https://github.com/Kuniwak/vint.git",
      :tag => "v#{version}",
      :revision => "d67d8d55e4436dca66f43a10406638a29154718a"

  depends_on "python"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/3d/d9/ea9816aea31beeadccd03f1f8b625ecf8f645bd66744484d162d84803ce5/PyYAML-5.3.tar.gz"
    sha256 "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
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
    assert_match /^Lint Vim script$/m, shell_output("#{bin}/vint -h", 0)

    output = pipe_output("#{bin}/vint -", "let foo = \"bar\"", 1)
    assert_match /Prefer single quoted strings/, output
  end
end
