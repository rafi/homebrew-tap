class Lstags < Formula
  desc "Manipulate Docker images across different registries"
  homepage "https://github.com/ivanilves/lstags"
  url "https://github.com/ivanilves/lstags/archive/v1.2.21.tar.gz"
  sha256 "43b7aae0c83e80c51259c96abb2b310feef0dd993364d9206d6c74990b4d54db"
  license "GPL-3.0"
  head "https://github.com/ivanilves/lstags.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-mod=vendor",
      "-ldflags", "-s -w",
      "-a", "-tags", "netgo", "-installsuffix", "netgo",
      *std_go_args
  end

  test do
    assert_match /VERSION/m, pipe_output("#{bin}/lstags --version 2>&1")
  end
end
