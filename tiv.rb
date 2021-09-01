class Tiv < Formula
  desc "display images in modern terminals using RGB ANSI codes"
  homepage "https://github.com/stefanhaustein/TerminalImageViewer"
  url "https://github.com/stefanhaustein/TerminalImageViewer/archive/v1.1.0.tar.gz"
  sha256 "d28c5746d25d83ea707db52b54288c4fc1851c642ae021951967e69296450c8c"
  license "Apache-2.0"
  head "https://github.com/stefanhaustein/TerminalImageViewer.git", branch: "master"

  depends_on "imagemagick" => :build

  def install
    cd "src/main/cpp" do
      system "make"
      system "make", "install"
    end
  end

  test do
  end
end
