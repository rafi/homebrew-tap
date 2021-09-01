class CompleteAlias < Formula
  desc "Automagical Bash shell alias completion"
  homepage "https://github.com/cykerway/complete-alias"
  url "https://github.com/cykerway/complete-alias/archive/1.18.0.tar.gz"
  sha256 "c34b85c2729650415d97280afeeed6aa29a9e318a8a39061722493cacb927445"
  license "GPL-3.0"
  head "https://github.com/cykerway/complete-alias.git", branch: "master"

  bottle :unneeded

  depends_on "bash-completion@2"

  def install
    (prefix/"etc/profile.d").install "complete_alias"
  end

  def caveats
    <<~EOS
      You will have to source the complete_alias utility in your $HOME/.bashrc:
        source "#{etc}/profile.d/complete_alias"

      Only then you can start upgrading your aliases to support tab completion:
        complete -F _complete_alias foo
        complete -F _complete_alias bar
        complete -F _complete_alias baz
    EOS
  end

  test do
  end
end
