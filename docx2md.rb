class Docx2md < Formula
  desc "Convert Microsoft Word Document to Markdown"
  homepage "https://github.com/mattn/docx2md"
  url "https://github.com/mattn/docx2md/archive/v0.0.6.tar.gz"
  sha256 "b678e7be35ebdfdddf6d9ba1f841251b87e42cef5afe7dd7271d73e821ae811b"
  license "MIT"
  head "https://github.com/mattn/docx2md.git", branch: "master"

  depends_on "go" => :build

  resource "sample_doc" do
    url "https://calibre-ebook.com/downloads/demos/demo.docx"
    sha256 "269329fc7ae54b3f289b3ac52efde387edc2e566ef9a48d637e841022c7e0eab"
  end

  def install
    system "go", "build", *std_go_args
  end

  test do
    testpath.install resource("sample_doc")
    system "#{bin}/docx2md", "#{testpath}/demo.docx"
  end
end
