class Displayplacer < Formula
  desc "Utility to configure multi-display resolutions and arrangements."
  homepage "https://github.com/jakehilborn/displayplacer"
  url "https://github.com/jakehilborn/displayplacer/archive/v1.4.0.tar.gz"
  sha256 "54b239359dbf9dc9b3a25e41a372eafb1de6c3131fe7fed37da53da77189b600"
  license "MIT"
  head "https://github.com/jakehilborn/displayplacer.git", branch: "master"

  def install
    system "make"
    bin.install "displayplacer"
  end

  test do
    system "#{bin}/displayplacer"
  end
end
