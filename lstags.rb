class Lstags < Formula
  version "1.2.18"
  desc "Manipulate Docker images across different registries"
  homepage "https://github.com/ivanilves/lstags"
  url "https://github.com/ivanilves/lstags.git",
      :tag => "v#{version}",
      :revision => "0c0991034b31cd13ece883389b7ff72c378df22b"

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
