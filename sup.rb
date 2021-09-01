class Sup < Formula
  desc "Super simple deployment tool"
  homepage "https://github.com/pressly/sup"
  url "https://github.com/pressly/sup/archive/v0.5.3.tar.gz"
  sha256 "e03e2b36524c2793c1768b6771f4ad8b96789786116acf2bd9037f152fcabf57"
  license "MIT"
  head "https://github.com/pressly/sup.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "auto"

    dir = buildpath/"src/github.com/pressly/sup"
    dir.install buildpath.children

    cd dir do
      system "go", "mod", "init", "github.com/pressly/sup"
      system "go", "mod", "tidy"
      system "go", "build", "-mod=readonly", "-o", "#{bin}/sup", "./cmd/sup"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/sup", "--version"
  end
end
