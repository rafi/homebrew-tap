class KubectlConfigImport < Formula
  desc "Merge kubeconfigs stored as Kubernetes secrets or files"
  homepage "https://github.com/rafi/kubectl-config-import"
  url "https://github.com/rafi/kubectl-config-import.git",
    tag: "v0.5.1",
    revision: "335f16b555855d0431b9ad24f07c2cfd830a5f9b"
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
