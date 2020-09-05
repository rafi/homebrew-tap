class CompleteAlias < Formula
  version "1.8.0"
  desc "Automagical Bash shell alias completion"
  homepage "https://github.com/cykerway/complete-alias"
  url "https://github.com/cykerway/complete-alias/archive/#{version}.tar.gz"
  sha256 "df3d1fb826e67f42793ff8ab1489c2b4059db03fbc9affd82dfd53d7d9079f9a"
  head "https://github.com/cykerway/complete-alias.git"

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
