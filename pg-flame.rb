class PgFlame < Formula
  desc "Flamegraph generator for Postgres EXPLAIN ANALYZE output"
  homepage "https://github.com/mgartner/pg_flame"
  url "https://github.com/mgartner/pg_flame/archive/v1.2.tar.gz"
  sha256 "913c25aa960b5542f94064ee15b77494e7d39adcddacdde31886f1891bb1a30a"
  license "Apache-2.0"
  head "https://github.com/mgartner/pg_flame.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/pg-flame", "-h"
  end
end
