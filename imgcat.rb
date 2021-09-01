class Imgcat < Formula
  desc "It's like cat, but for images."
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/releases/download/v2.5.0/imgcat-2.5.0.tar.gz"
  sha256 "8f18e10464ed1426b29a5b11aee766a43db92be17ba0a17fd127dd9cf9fb544b"
  license "ISC"
  head "https://github.com/eddieantonio/imgcat.git", branch: "master"

  depends_on "libpng" => :recommended
  depends_on "jpeg"

  def install
    system "./configure"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      The imgcat binary conflicts with iTerm2 3.0's shell script of the same name.
      To use this formula as drop-in replacement, add `unalias imgcat` to your
      shell startup file **after** sourcing the shell integration, like so:
          unalias imgcat
      See https://github.com/eddieantonio/imgcat for more information.
    EOS
  end

  test do
    output = shell_output("#{bin}/imgcat -d 256 #{test_fixtures("test.jpg")}")
    # Ensure that it produces xterm 256 colour output
    assert output =~ /[\x1b]\[48;5;\d+m/
  end
end
