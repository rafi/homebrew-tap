class Reg < Formula
  desc "Docker registry v2 cli repo browser with security checks"
  homepage "https://github.com/genuinetools/reg"
  url "https://github.com/genuinetools/reg.git",
      :tag => "v0.15.8",
      :revision => "d021aeb0b9786eac1212b5faaa70d11f56c60991"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/genuinetools/reg").install buildpath.children
    cd "src/github.com/genuinetools/reg" do
      system "go", "build", "-o", bin/"reg"
      prefix.install_metafiles
    end
  end

  test do
    assert_match /401/m, pipe_output("#{bin}/reg ls \
      https://index.docker.io 2<&1 \
    ")
  end
end
