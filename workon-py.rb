class WorkonPy < Formula
  desc "Simple pipenv bash alternative, virtual-environment management helper"
  homepage "https://github.com/rafi/workon-py"
  url "https://github.com/rafi/workon-py/archive/1.2.0.tar.gz"
  sha256 "634b7e1ca34775c5fb4669f1be7a8afe0aba97a9af5e36361eac51aedf45bcb7"
  head "https://github.com/rafi/workon-py.git"

  bottle :unneeded

  def install
    (prefix/"bin").install "workon"

    # Install bash completion
    (bash_completion/"workon").install "workon-completion.bash"
  end

  test do
    testcmd = "/bin/bash -c 'workon -h' 2>&1'"
    assert_match "WORKON_VIRTUALENV", pipe_output(testcmd)
  end
end
