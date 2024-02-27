class Lstags < Formula
  desc "Manipulate Docker images across different registries"
  homepage "https://github.com/ivanilves/lstags"
  url "https://github.com/ivanilves/lstags/archive/v1.2.23.tar.gz"
  sha256 "43ecc6b925e85cb6656b0114cc1404611cb5a4c50e0eeda80bcf5727ebf8c187"
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
