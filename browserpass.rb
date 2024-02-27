# Credits: https://github.com/Amar1729/homebrew-formulae
class Browserpass < Formula
  version "3.1.0"
  desc "Browserpass host application to support Chrome extension"
  homepage "https://github.com/browserpass/browserpass-native"
  license "ISC"

  if Hardware::CPU.arm?
    url "https://github.com/browserpass/browserpass-native/releases/download/#{version}/browserpass-darwin-arm64-#{version}.tar.gz"
    sha256 "3f5b32ce32c9661034825d9bdd23dc183041563a7fa29aa72b0628fb87c20c42"
  else
    url "https://github.com/browserpass/browserpass-native/releases/download/#{version}/browserpass-darwin64-#{version}.tar.gz"
    sha256 "a27c2a174511fbc32b1bc2571398f3371a86606f62c717223559b2268d75ce51"
  end

  resource "testfile" do
    url "https://github.com/browserpass/browserpass-native/files/3062744/request.hex.txt"
    sha256 "83ea960015e5bd05e604c13233d8ed16a87c38f83212822e8d69c622dea21af0"
  end

  depends_on "coreutils" => :build
  depends_on "gnu-sed" => :build
  depends_on "gpg"
  depends_on "pinentry"
  depends_on "pinentry-mac"

  def install
    ENV["DESTDIR"] = ""
    ENV["PREFIX"] = prefix.to_s

    if Hardware::CPU.arm?
      inreplace "Makefile", "BIN ?= browserpass", "BIN ?= browserpass-darwin-arm64"
    else
      inreplace "Makefile", "BIN ?= browserpass", "BIN ?= browserpass-darwin64"
    end
    system "make", "configure"
    system "make", "install"

    # NOT possible to symlink the hosts files from a homebrew formula, since they go under HOME
    # Unfortunately, need to have the user do them manually
    # (same with policies, if the user wants them)
  end

  def caveats
    <<~EOF
  ********************************************************************************
  * To configure your browser, RUN THE FOLLOWING:

  $ BROWSER=chromium  # one of the following: [chromium chrome vivaldi brave firefox]
  $ PREFIX='#{prefix}' make hosts-$BROWSER-user -f '#{prefix}/lib/browserpass/Makefile'
  ********************************************************************************
    EOF
  end

  test do
    resource("testfile").stage(testpath)
    # fails with 14: $HOME/.password-store doesn't exist, since homebrew uses its own $HOME
    # a return value other than 14 is incorrect here
    if Hardware::CPU.arm?
      shell_output("#{prefix}/bin/browserpass-darwin-arm64 < #{testpath}/request.hex.txt 2>/dev/null", 14)
    else
      shell_output("#{prefix}/bin/browserpass-darwin64 < #{testpath}/request.hex.txt 2>/dev/null", 14)
    end
  end
end
