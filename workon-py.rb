class WorkonPy < Formula
  desc "Simple pipenv bash alternative, virtual-environment management helper"
  homepage "https://github.com/rafi/workon-py"
  url "https://github.com/rafi/workon-py/archive/1.2.0.tar.gz"
  sha256 "634b7e1ca34775c5fb4669f1be7a8afe0aba97a9af5e36361eac51aedf45bcb7"
  head "https://github.com/rafi/workon-py.git", branch: "master"

  bottle :unneeded

  depends_on "bash-completion@2"

  def install
    bin.install "workon"
    bash_completion.install "workon-completion.bash"
  end

  test do
    assert_match /WORKON_VIRTUALENV/m, pipe_output("workon -h 2>&1")
  end
end
