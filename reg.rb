class Reg < Formula
  version "0.16.1"
  desc "Docker registry v2 cli repo browser with security checks"
  homepage "https://github.com/genuinetools/reg"
  url "https://github.com/genuinetools/reg.git",
      :tag => "v#{version}",
      :revision => "4203e559f331009df04a3ca47820989c6c43e138"

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
