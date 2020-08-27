class Fz < Formula
  desc "Adds tab completion for z jump around"
  homepage "https://github.com/changyuheng/fz"
  head "https://github.com/changyuheng/fz.git"

  bottle :unneeded

  # depends_on "z"
  # depends_on "zlua"
  depends_on "fzf"

  def install
    (prefix/"etc/profile.d").install "fz.sh"
    (prefix/"etc/profile.d").install "fz.plugin.zsh"
  end

  def caveats
    <<~EOS
      fz needs to be sourced after z in your ~/.bashrc or ~/.zshrc
        Bash: source "#{etc}/etc/profile.d/fz.sh"
        Zsh: source "#{etc}/etc/profile.d/fz.plugin.zsh"
    EOS
  end

  test do
  end
end
