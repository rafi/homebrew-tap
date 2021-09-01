class Txeh < Formula
  desc "Utilty for /etc/hosts management"
  homepage "https://github.com/txn2/txeh"
  url "https://github.com/txn2/txeh/archive/v1.3.0.tar.gz"
  sha256 "c9495f445e7eda26f54d018660fc5b872e9257a8f5fa28c5e508df6d201cf84b"
  license "Apache-2.0"
  head "https://github.com/txn2/txeh.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-ldflags",
      "-X github.com/txn2/txeh/util/cmd.Version=#{version}",
      *std_go_args,
      "./util/txeh.go"
  end

  test do
    assert_match /#{version}/m, pipe_output("#{bin}/txeh version")

    (testpath/"etc-hosts.txt").write <<~EOS
      1.2.3.4 foobar
    EOS
    output = shell_output("#{bin}/txeh --read etc-hosts.txt show", 0)
    assert_match /^1.2.3.4.*foobar$/, output
  end
end
