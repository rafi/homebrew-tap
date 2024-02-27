class Triage < Formula
  desc "Interactive command-line GitHub issue and notification triaging tool"
  homepage "https://github.com/tj/triage"
  url "https://github.com/tj/triage/archive/v1.0.0.tar.gz"
  sha256 "a2d249857c1c6ba408973ec865363a960d5829012a9a8d2870ec163daad15b22"
  license "MIT"
  head "https://github.com/tj/triage.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args, "./cmd/triage/main.go"
  end

  test do
    system "#{bin}/triage", "-v"
  end
end
