class Gof < Formula
  desc "fuzzy file finder with vim api"
  homepage "https://github.com/mattn/gof"
  url "https://github.com/mattn/gof/archive/v0.0.13.tar.gz"
  sha256 "4e73d4edac96389ef8ad91fbf1d3b5172b1119e8fcbd0d5cf69dbe3d551e563d"
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
