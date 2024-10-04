class KubectlConfigImport < Formula
  desc "Merge kubeconfigs stored as Kubernetes secrets or files"
  homepage "https://github.com/rafi/kubectl-config-import"
  url "https://github.com/rafi/kubectl-config-import.git",
    tag: "v0.5.0",
    revision: "ee5ff603aa1be040f4c176780e27c2b8f8561bb6"
  head "https://github.com/rafi/kubectl-config-import.git", branch: "master"

  depends_on "yq"
  depends_on "fzf"

  def install
    bin.install "kubectl-config_import"
  end

  test do
    system "#{bin}/kubectl-config_import --help"
  end
end
