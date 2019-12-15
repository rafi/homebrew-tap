class Red < Formula
  desc "Terminal log analysis tools"
  homepage "https://github.com/antonmedv/red"
  head "https://github.com/antonmedv/red.git"
  url "https://github.com/antonmedv/red.git",
      :tag => "v0.0.0",
      :revision => "4203e559f331009df04a3ca47820989c6c43e138"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/antonmedv/red").install buildpath.children
    cd "src/github.com/antonmedv/red" do
      system "go", "build", "-o", bin/"red"
      prefix.install_metafiles
    end
  end

  test do
  end
end
