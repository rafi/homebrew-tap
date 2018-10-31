class Yaml2json < Formula
  desc "a command line tool convert from yaml to json"
  homepage "https://github.com/bronze1man/yaml2json"
  head "https://github.com/bronze1man/yaml2json.git"
  url "https://github.com/bronze1man/yaml2json.git",
      :tag => "v1.2",
      :revision => "5c26c4289d7a1ea54372e39dc3dee094e85ec445"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/bronze1man/yaml2json").install buildpath.children
    cd "src/github.com/bronze1man/yaml2json" do
      system "go", "build", "-o", bin/"yaml2json"
      prefix.install_metafiles
    end
  end

  test do
  end
end
