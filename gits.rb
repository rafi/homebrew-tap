class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  url "https://github.com/rafi/gits.git",
    tag: "v0.64.0",
    revision: "1d55733ae86e8299e3f68f3e507d7d9023ce6cc2"
  head "https://github.com/rafi/gits.git", branch: "master"

  depends_on "go" => :build
  depends_on "just" => :build

  uses_from_macos "ncurses"

  def install
    # Don't dirty the git tree
    rm_rf ".brew_home"

    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    system "just", "build", os, arch
    bin.install "bin/release/gits-#{os}-#{arch}" => "gits"

    generate_completions_from_executable(bin/"gits", "completion")
  end

  test do
    system "#{bin}/gits", "version"
  end
end
