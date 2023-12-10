class Gits < Formula
  desc "a fast cli git manager for multiple repositories"
  homepage "https://github.com/rafi/gits"
  url "https://github.com/rafi/gits.git",
    tag: "v0.3.5",
    revision: "a34302bd67b6bd0ae61613f2d0e1a877e8078dbdf4fbc630ede0f8b7f6546ce4"
  head "https://github.com/rafi/gits.git", branch: "next"

  depends_on "go" => :build

  uses_from_macos "ncurses"

  def install
    # Don't dirty the git tree
    rm_rf ".brew_home"

    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    system "make", "bin/release/gits-#{os}-#{arch}"
    bin.install "bin/release/gits-#{os}-#{arch}" => "gits"

    generate_completions_from_executable(bin/"gits", "completion")
  end

  test do
    system "#{bin}/gits", "version"
  end
end
