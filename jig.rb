class Jig < Formula
  desc "tmux launcher"
  homepage "https://github.com/rafi/jig"
  url "https://github.com/rafi/jig.git",
    tag: "v0.1.2",
    revision: "e93b4fd33139db8caf929dda7c7c72cf28a48f77"
  head "https://github.com/rafi/jig.git", branch: "next"

  depends_on "go"   => :build
  depends_on "just" => :build

  uses_from_macos "ncurses"

  def install
    # Don't dirty the git tree
    rm_rf ".brew_home"

    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    system "just", "build", os, arch
    bin.install "bin/release/jig-#{os}-#{arch}" => "jig"

    bash_completion.install "completion/jig.bash"
    fish_completion.install "completion/jig.fish"
  end

  test do
    system "#{bin}/jig", "version"
  end
end
