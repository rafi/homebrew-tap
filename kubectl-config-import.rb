class KubectlConfigImport < Formula
  desc "Merge kubeconfigs stored as Kubernetes secrets or files"
  homepage "https://github.com/rafi/kubectl-config-import"
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
