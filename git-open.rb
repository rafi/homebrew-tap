class GitOpen < Formula
  desc "Open website for a repository in your browser"
  homepage "https://github.com/paulirish/git-open"
  url "https://github.com/paulirish/git-open/archive/v2.1.0.tar.gz"
  sha256 "0cf7f7f55c611c8dfccf0a3135df4032f2ea085491be84fb565cac2d744c4951"
  license "MIT"
  head "https://github.com/paulirish/git-open.git", branch: "master"

  depends_on "go-md2man" => :build

  def install
    bin.install "git-open"
    system "go-md2man", "-in", "git-open.1.md", "-out", "git-open.1"
    man1.install Dir["git-open.1"]
  end

  test do
    system "#{bin}/git-open", "-h"
  end
end
