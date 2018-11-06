class Yaml2json < Formula
  desc "a command line tool convert from yaml to json"
  homepage "https://github.com/bronze1man/yaml2json"
  head "https://github.com/bronze1man/yaml2json.git"
  url "https://github.com/bronze1man/yaml2json.git",
      :tag => "v1.3",
      :revision => "a361dee9f0c07a192c53114f47c23024f2b697bb"

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
