class GitFame < Formula
  include Language::Python::Virtualenv

  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame"
  head "https://github.com/casperdcl/git-fame.git"
  url "https://github.com/casperdcl/git-fame.git",
      :tag => "v1.11.0",
      :revision => "eb15381c12f47e1b2fc36eee5e612c5bf3170913"

  depends_on "python"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/12/67/e736c012c6c8b4092dd54bb9bdd7737acf9a140a98c58b87c35363d0105d/tqdm-4.45.0.tar.gz"
    sha256 "00339634a22c10a7a22476ee946bbde2dbe48d042ded784e4d88e0236eca5d81"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/f1/92/bd312f86ad375259ed614b5f61858ef56a5f3c023731835d3fd99c1634fd/argopt-0.6.1.tar.gz"
    sha256 "c8ca9cdeb6bf5e8d6b0fb6a6cd3c676210fd3ebacdabab57f5b95d1ed514f0af"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/57/6f/213d075ad03c84991d44e63b6516dd7d185091df5e1d02a660874f8f7e1e/tabulate-0.8.7.tar.gz"
    sha256 "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
  end

  def install
    man1.install Dir["gitfame/git-fame.1"]
    bash_completion.install "git-fame_completion.bash"
    virtualenv_install_with_resources
  end

  test do
    shell_output("#{bin}/git-fame -h", 0)
    assert_match (/^#{version}$/), shell_output("#{bin}/git-fame -v", 0)
  end
end
