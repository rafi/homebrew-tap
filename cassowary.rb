class Cassowary < Formula
  desc "Modern cross-platform HTTP load-testing tool written in Go"
  homepage "https://github.com/rogerwelin/cassowary"
  head "https://github.com/rogerwelin/cassowary.git"
  url "https://github.com/rogerwelin/cassowary.git",
      :tag => "v0.11.0",
      :revision => "aa7459b73d2fe6064775e30b26ee9b512ce1f50d"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"

    dir = buildpath/"src/github.com/rogerwelin/cassowary"
    dir.install buildpath.children

    cd dir do
      system "go", "mod", "vendor"
      system "go", "build", "-mod", "vendor", \
        "-o", bin/"cassowary", "./cmd/cassowary"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "cassowary", shell_output("#{bin}/cassowary --version")
  end
end
