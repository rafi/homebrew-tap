class Seq2gif < Formula
  desc "Convert a ttyrec recording directly into a gif animation"
  homepage "https://github.com/saitoha/seq2gif"
  url "https://github.com/saitoha/seq2gif/archive/v0.10.4.tar.gz"
  sha256 "738805bf8eb7ee5171ded7f43326cca7caecb77031283720f97253c234261f29"
  license "MIT"
  head "https://github.com/saitoha/seq2gif.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/seq2gif -V"
  end
end
