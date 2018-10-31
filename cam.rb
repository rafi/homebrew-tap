class Cam < Formula
  desc "unix command cam: view images inside terminal"
  homepage "https://github.com/itchyny/cam"
  url "https://github.com/itchyny/cam/releases/download/1.0/cam-1.0.tar.gz"
  sha256 "80257fd74579e13438b05edf50dcdc8cf0cdb1870b4a2bc5967bd1fdbed1facf"
  head "https://github.com/itchyny/cam.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build

  def install
    system "autoreconf", "-ivf"
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
  end
end
