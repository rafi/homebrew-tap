class GitFame < Formula
  include Language::Python::Virtualenv

  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame"
  url "https://files.pythonhosted.org/packages/7a/f2/fd903eafd3bf5d5dff0d5885a9fd9f25d3779968897e61d406c57ed0aaf9/git-fame-2.0.1.tar.gz"
  sha256 "e74319c409aed8c84fccb1695782c2d1b01178f32e85165ea87e4a1bedb24920"
  license "MPL-2.0"
  head "https://github.com/casperdcl/git-fame.git", branch: "master"

  depends_on "python"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/ea/85/3ce0f9f7d3f596e7ea57f4e5ce8c18cb44e4a9daa58ddb46ee0d13d6bff8/tqdm-4.66.2.tar.gz"
    sha256 "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/88/1e/4dd20f0ad39f81dd815b6fa4fea53be370d2ca0eeef9f8dc8e05b81c4284/argopt-0.8.2.tar.gz"
    sha256 "fabdb99043a82a320e0c257719f59a677404640dce97b079d2dac9b6b581aeec"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
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
