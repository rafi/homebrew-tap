class Timg < Formula
  desc "terminal image viewer with 24bit support"
  homepage "https://github.com/hzeller/timg"
  url "https://github.com/hzeller/timg/archive/v0.9.8.tar.gz"
  sha256 "436e2c3b5f43e906786ca150d11e521281d558329a7bc00198fe30d6907ee8c4"
  head "https://github.com/hzeller/timg.git"

  depends_on "pkg-config" => :build
  depends_on "graphicsmagick" => :build

  def install
    cd "src" do
      system "make", "timg"
      (prefix/"bin").install "timg"
    end
  end

  test do
  end
end
