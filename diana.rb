class Diana < Formula
  desc "Tracks most-used directories to make cd smarter"
  homepage "https://github.com/baskerville/diana"
  url "https://github.com/baskerville/diana/archive/0.1.tar.gz"
  sha256 "84707f40a8278c273c98ce57251c7e9ff28d121015e0c1841e0c41ca20ff391a"
  head "https://github.com/baskerville/diana.git"

  bottle :unneeded

  def install
    (prefix/"bin").install "diana"
    (prefix/"bin").install "dad"
  end

  test do
  end
end
