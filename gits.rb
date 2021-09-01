class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  url "https://github.com/rafi/gits/archive/v0.3.0.tar.gz"
  sha256 "86a3be6c20253762eb508028a87c529956805b2c059e5d9267ec25bc7973ed86"
  head "https://github.com/rafi/gits.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-ldflags",
      "-X github.com/rafi/gits/cmd.Version=#{version}",
      *std_go_args

    # Install bash completion
    output = Utils.popen_read("#{bin}/gits completion 2>/dev/null")
    (bash_completion/"gits-completion.bash").write output
  end

  test do
    system "#{bin}/gits", "version"
  end
end
