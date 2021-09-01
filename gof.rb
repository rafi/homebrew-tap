class Gof < Formula
  desc "fuzzy file finder with vim api"
  homepage "https://github.com/mattn/gof"
  url "https://github.com/mattn/gof/archive/v0.0.10.tar.gz"
  sha256 "a47d17ad6c74a753f83e3b1c8ce8d2b84997092ff4678f80500bc1ceea9bf836"
  license "MIT"
  head "https://github.com/mattn/gof.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-ldflags",
      "-s -w -X main.revision=#{version}",
      *std_go_args
  end

  test do
    system "#{bin}/gof", "-v"
  end
end
