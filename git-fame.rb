class GitFame < Formula
  include Language::Python::Virtualenv

  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame"
  url "https://files.pythonhosted.org/packages/e0/32/9b257c9cc4f8ff7f9b6f146099ecd2c012d8f2b9043338e02251e1c32d2d/git-fame-1.15.0.tar.gz"
  sha256 "00e7205cb885f486ec57bef2cf2b9d97a683b86563756557685f85ecfb907074"
  license "MPL-2.0"
  head "https://github.com/casperdcl/git-fame.git", branch: "master"

  depends_on "python"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/37/e5/1b54ef934d731576d0145bc8ae22da5b410f96922cec52b91cc29d3ff1b6/tqdm-4.62.2.tar.gz"
    sha256 "a4d6d112e507ef98513ac119ead1159d286deab17dffedd96921412c2d236ff5"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d/PyYAML-5.4.1.tar.gz"
    sha256 "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
  end

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/22/bf/527c5f49017645f36f40f369006febae597e42f2188f50c194d45ac22761/argopt-0.7.0.tar.gz"
    sha256 "aa7ba8d58abed4f625138a1608d70a4f6bd80322c76d1aec47f43270e73c7a79"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ae/3d/9d7576d94007eaf3bb685acbaaec66ff4cdeb0b18f1bf1f17edbeebffb0a/tabulate-0.8.9.tar.gz"
    sha256 "eb1d13f25760052e8931f2ef80aaf6045a6cceb47514db8beab24cded16f13a7"
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
