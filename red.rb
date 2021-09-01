class Red < Formula
  desc "Terminal log analysis tools"
  homepage "https://github.com/antonmedv/red"
  url "https://github.com/antonmedv/red/archive/v0.0.0.tar.gz"
  sha256 "aca0a535c2183e9e50c2603281b8672dfefa3a344fbc86281cb0eb2c24a4409b"
  license "MIT"
  head "https://github.com/antonmedv/red.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/red", "-help"
  end
end
