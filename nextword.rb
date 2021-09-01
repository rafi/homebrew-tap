class Nextword < Formula
  desc "Predict next English words"
  homepage "https://github.com/high-moctane/nextword"
  url "https://github.com/high-moctane/nextword/archive/v0.0.5.tar.gz"
  sha256 "5a4fb45e155cf97f83e73de8723c903abbf3a4cae6d9225cbaa31685d58540f3"
  license "MIT"
  head "https://github.com/high-moctane/nextword.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/nextword", "-v"
  end
end
