class Diana < Formula
  desc "A command line interface to the aria2 daemon"
  homepage "https://github.com/baskerville/diana"
  url "https://github.com/baskerville/diana/archive/0.1.tar.gz"
  sha256 "84707f40a8278c273c98ce57251c7e9ff28d121015e0c1841e0c41ca20ff391a"
  license "MIT"
  head "https://github.com/baskerville/diana.git", branch: "master"

  bottle :unneeded

  depends_on "python"

  def install
    (prefix/"bin").install "diana"
    (prefix/"bin").install "dad"
  end

  test do
    system "#{bin}/dad"
    system "#{bin}/diana"
  end
end
