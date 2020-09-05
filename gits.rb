class Gits < Formula
  version "0.3.0"
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  head "https://github.com/rafi/gits.git"
  url "https://github.com/rafi/gits.git",
      :tag => "v#{version}",
      :revision => "39f59b1ab81830102bac883d4538a72fa934671b"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/github.com/rafi/gits").install buildpath.children
    cd "src/github.com/rafi/gits" do
      system "go", "build",
        "-ldflags",
        "-X github.com/rafi/gits/cmd.Version=v#{version}",
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
