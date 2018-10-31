class Image2ascii < Formula
  desc "Converts images into ASCII images"
  homepage "https://github.com/qeesung/image2ascii"
  head "https://github.com/qeesung/image2ascii.git"
  url "https://github.com/qeesung/image2ascii.git",
      :tag => "v1.0.0",
      :revision => "0f8461344d1b941a39404dfc93fca0c8a370e4da"

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
