class Timg < Formula
  desc "terminal image viewer with 24bit support"
  homepage "https://github.com/hzeller/timg"
  url "https://github.com/hzeller/timg/archive/v0.9.5.tar.gz"
  sha256 "285f51e95bed3d477b585db2998ef10b32c230d64d8015748e45f9a6e013ce48"
  head "https://github.com/hzeller/timg.git"

  depends_on "pkg-config" => :build
  depends_on "graphicsmagick" => :build

  def install
    cd "src" do
      system "make"
      system "make", "install", "PREFIX=#{prefix}"
    end
  end

  test do
  end
end
