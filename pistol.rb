class Pistol < Formula
  desc "General purpose file previewer"
  homepage "https://github.com/doronbehar/pistol"
  url "https://github.com/doronbehar/pistol/archive/v0.4.2.tar.gz"
  sha256 "559607de2904b7a45456eeabb6d60f2586fa50168f3974ec24f8b341dd8458de"
  license "MIT"
  head "https://github.com/doronbehar/pistol.git", branch: "master"

  depends_on "go" => :build
  depends_on "libmagic" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/pistol --help"
  end
end
