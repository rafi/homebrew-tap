class MarkdownTui < Formula
  desc "Markdown Renderer for the terminal"
  homepage "https://github.com/MichaelMure/mdr"
  url "https://github.com/MichaelMure/mdr/archive/v0.2.5.tar.gz"
  sha256 "7b8e4aa229094fbc4cb616470ab30b5665aa42d479d33407f95b45a336d2d88f"
  license "MIT"
  head "https://github.com/MichaelMure/mdr.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/mdr"
  end
end
