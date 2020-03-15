class Lstags < Formula
  desc "Manipulate Docker images across different registries"
  homepage "https://github.com/ivanilves/lstags"
  url "https://github.com/ivanilves/lstags.git",
      :tag => "v1.2.14",
      :revision => "6b3aeb61525839765045834e59285160c7386105"

  depends_on "go" => :build

  def install
    (buildpath/"src/github.com/ivanilves/lstags").install buildpath.children
    cd "src/github.com/ivanilves/lstags" do
      system "go", "build", "-o", bin/"lstags"
      prefix.install_metafiles
    end
  end

  test do
    assert_match /VERSION/m, pipe_output("#{bin}/lstags --version 2<&1")
  end
end
