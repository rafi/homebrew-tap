class Robo < Formula
  desc "Simple Go / YAML-based task runner for the team"
  homepage "https://github.com/tj/robo"
  url "https://github.com/tj/robo/archive/v0.7.0.tar.gz"
  sha256 "b9f57212b6ab755eaa0ad9c5b89b0baed385417ac38020dec04602db7af768b3"
  license "MIT"
  head "https://github.com/tj/robo.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    shell_output("#{bin}/robo --help", 0)
    assert_match (/^#{version}$/), shell_output("#{bin}/robo --version", 0)
  end
end
