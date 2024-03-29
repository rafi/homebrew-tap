class Gitstatus < Formula
  desc "Git status for Bash/Zsh prompt"
  homepage "https://github.com/romkatv/gitstatus"
  url "https://github.com/romkatv/gitstatus/archive/v1.5.4.tar.gz"
  sha256 "23215748fe413b5537e7ce71ea9eae2075bfa43ff0fbe0ed451d1688f6d5c415"
  license "GPL-3.0"
  head "https://github.com/romkatv/gitstatus.git", branch: "master"

  depends_on "bash" => :test
  depends_on "zsh"  => :test

  def install
    system "make", "pkg"
    prefix.install Dir["gitstatus.prompt.*"]
    cd "usrbin" do
      bin.install "gitstatusd-darwin-x86_64" => "gitstatusd"
    end
  end

  def caveats
    <<~EOS
      To activate gitstatus in Bash, add the following line to .bashrc:

        source #{opt_prefix}/gitstatus.prompt.sh

      To activate gitstatus in Zsh, add the following line to .zshrc:

        source #{opt_prefix}/gitstatus.prompt.zsh

      If your .zshrc sets ZSH_THEME, remove that line.
    EOS
  end

  test do
    assert_match "SUCCESS",
      shell_output("bash --norc -ic '. #{opt_prefix}/gitstatus.prompt.zsh && gitstatus_start MY && echo SUCCESS'")
    assert_match "SUCCESS",
      shell_output("zsh -fic '. #{opt_prefix}/gitstatus.prompt.zsh && gitstatus_start MY && echo SUCCESS'")
  end
end
