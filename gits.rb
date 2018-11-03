class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  head "https://github.com/rafi/gits.git"
  url "https://github.com/rafi/gits.git",
      :tag => "v0.1.0",
      :revision => "d588c1bc8f761127a845a8f2c60f67c5b538d09f"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/rafi/gits").install buildpath.children
    cd "src/github.com/rafi/gits" do
      system "go", "build", "-o", bin/"gits"
      prefix.install_metafiles
    end
  end

  test do
  end
end
