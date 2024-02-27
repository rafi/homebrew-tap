class Txeh < Formula
  desc "Utilty for /etc/hosts management"
  homepage "https://github.com/txn2/txeh"
  url "https://github.com/txn2/txeh/archive/v1.5.4.tar.gz"
  sha256 "5b442c66531c2cc1e75569ea3754c2fe7328d982481c13c8dc1f80f096d6c823"
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
