class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  url "https://github.com/rafi/gits/archive/v0.3.5.tar.gz"
  sha256 "a34302bd67b6bd0ae61613f2d0e1a877e8078dbdf4fbc630ede0f8b7f6546ce4"
  head "https://github.com/rafi/gits.git", branch: "master"

  depends_on "go@1.18" => :build

  def install
    system "go", "build",
      "-ldflags",
      "-s -w -X github.com/rafi/gits/cmd.version=#{version}",
      *std_go_args

    # Install bash completion
    output = Utils.popen_read("#{bin}/gits completion 2>/dev/null")
    (bash_completion/"gits-completion.bash").write output
  end

  test do
    system "#{bin}/gits", "version"
  end
end
