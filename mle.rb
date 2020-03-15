class Mle < Formula
  desc "Flexible terminal-based text editor"
  homepage "https://github.com/adsr/mle"
  head "https://github.com/adsr/mle.git"
  url "https://github.com/adsr/mle.git",
      :tag => "v1.4.3",
      :revision => "af07127e639664c34fe2ebf5d887a844f5f1129a"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "pcre" => :build
  depends_on "termbox" => :build
  depends_on "uthash" => :build
  depends_on "lua"

  def install
    system "make", "prefix=#{prefix}"
    bin.install "mle"
    man1.install Dir["mle.1"]
  end

  test do
    cmd = "#{bin}/mle -M 'test C-e space w o r l d enter' -p test 2<&1"
    assert_match /^hello world$/, pipe_output(cmd, "hello", 0)
  end
end
