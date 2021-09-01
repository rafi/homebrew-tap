class Image2ascii < Formula
  desc "Converts images into ASCII images"
  homepage "https://github.com/qeesung/image2ascii"
  url "https://github.com/qeesung/image2ascii/archive/v1.0.1.tar.gz"
  sha256 "59a9d323870722f549f23ea5d1fea69433717e29e0c0a4fd70051f5419ff72ab"
  license "MIT"
  head "https://github.com/qeesung/image2ascii.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "auto"

    dir = buildpath/"src/github.com/qeesung/image2ascii"
    dir.install buildpath.children

    cd dir do
      system "go", "mod", "init", "github.com/qeesung/image2ascii"
      system "go", "mod", "tidy"
      system "go", "build", "-mod=readonly", "-o", "#{bin}/image2ascii"
      prefix.install_metafiles
    end
  end

  test do
    output = shell_output("#{bin}/image2ascii -w 1 -g 1 -f #{test_fixtures("test.jpg")}")
    assert output =~ /[\x1b]\[38;5;\d+mi[\x1b]\[0;\d+m/
  end
end
