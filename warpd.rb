class Warpd < Formula
  desc "A modal keyboard-driven virtual pointer"
  homepage "https://github.com/rvaiya/warpd"
  url "https://github.com/rvaiya/warpd/releases/download/v1.3.5/warpd-1.3.5-osx.tar.gz"
  sha256 "4a4bbaeb3a864cd45b3d3bd841bdd87dc67b2099b860da18b81efb23d28afb2b"
  license "MIT"
  head "https://github.com/rvaiya/warpd.git", branch: "master"

  def install
    system "make"
    bin.install "bin/warpd"
  end

  test do
    system "#{bin}/warpd --version"
  end
end
