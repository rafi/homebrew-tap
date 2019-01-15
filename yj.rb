class Yj < Formula
  desc "Convert to and from YAML, TOML, JSON, or HCL"
  homepage "https://github.com/sclevine/yj"
  head "https://github.com/sclevine/yj.git"
  url "https://github.com/sclevine/yj.git",
      :tag => "v3.0",
      :revision => "d14a82857cce15d3f81c5d34ff1fc9fe3a9cdaf1"

  depends_on "go" => :build

  def install
    (buildpath/"src/github.com/sclevine/yj").install buildpath.children
    cd "src/github.com/sclevine/yj" do
      system "go", "build", "-o", bin/"yj"
      prefix.install_metafiles
    end
  end

  test do
    json = <<~EOS.chomp
      {"foo.bar":"baz","qux":1}

    EOS
    yaml = <<~EOS.chomp
      foo.bar: baz
      qux: 1

    EOS
    toml = <<~EOS.chomp
      "foo.bar" = "baz"
      qux = 1

    EOS
    hcl = <<~EOS.chomp
      "foo.bar" = "baz"

      "qux" = 1
    EOS
    assert_equal yaml, pipe_output("#{bin}/yj -yy", yaml)
    assert_equal yaml, pipe_output("#{bin}/yj -jy", json)
    assert_equal yaml, pipe_output("#{bin}/yj -ty", toml)
    assert_equal yaml, pipe_output("#{bin}/yj -cy", hcl)
    assert_equal json, pipe_output("#{bin}/yj -yj", yaml)
    assert_equal json, pipe_output("#{bin}/yj -jj", json)
    assert_equal json, pipe_output("#{bin}/yj -tj", toml)
    assert_equal json, pipe_output("#{bin}/yj -cj", hcl)
    assert_equal toml, pipe_output("#{bin}/yj -yt", yaml)
    # assert_equal toml, pipe_output("#{bin}/yj -jt", json)
    assert_equal toml, pipe_output("#{bin}/yj -tt", toml)
    assert_equal toml, pipe_output("#{bin}/yj -ct", hcl)
    assert_equal hcl, pipe_output("#{bin}/yj -yc", yaml)
    assert_equal hcl, pipe_output("#{bin}/yj -jc", json)
    assert_equal hcl, pipe_output("#{bin}/yj -tc", toml)
    assert_equal hcl, pipe_output("#{bin}/yj -cc", hcl)
  end
end
