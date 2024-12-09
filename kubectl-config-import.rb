class KubectlConfigImport < Formula
  desc "Merge kubeconfigs stored as Kubernetes secrets or files"
  homepage "https://github.com/rafi/kubectl-config-import"
  url "https://github.com/rafi/kubectl-config-import.git",
    tag: "v0.6.7",
    revision: "4af4c560d212f3fd5434c82a2b94f8207f799358"
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
