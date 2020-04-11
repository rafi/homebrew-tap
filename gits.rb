class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  head "https://github.com/rafi/gits.git"
  url "https://github.com/rafi/gits.git",
      :tag => "v0.2.1",
      :revision => "bc8157e9138c34974344fa90a31a3fe77dff19df"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/rafi/gits").install buildpath.children
    cd "src/github.com/rafi/gits" do
      system "go", "build",
        "-ldflags",
        "-X github.com/rafi/gits/cmd.Version=#{version}",
        "-o", bin/"gits"

      # Install bash completion
      output = Utils.popen_read("#{bin}/gits completion 2>/dev/null")
      (bash_completion/"gits-completion.bash").write output

      prefix.install_metafiles
    end
  end

  test do
  end
end
