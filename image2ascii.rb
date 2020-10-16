class Image2ascii < Formula
  desc "Converts images into ASCII images"
  homepage "https://github.com/qeesung/image2ascii"
  head "https://github.com/qeesung/image2ascii.git"
  url "https://github.com/qeesung/image2ascii.git",
      :tag => "v1.0.1",
      :revision => "ea02edb8d9c87c5c62535bbc59d84bbafead03a2"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/qeesung/image2ascii").install buildpath.children
    cd "src/github.com/qeesung/image2ascii" do
      system "go", "build", "-o", bin/"image2ascii"
      prefix.install_metafiles
    end
  end

  test do
  end
end
