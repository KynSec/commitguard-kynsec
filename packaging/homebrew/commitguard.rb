class Commitguard < Formula
  include Language::Python::Virtualenv

  desc "Offline-first local security control plane for secrets, SAST, SCA, and policy"
  homepage "https://github.com/KynSec/commitguard-kynsec"
  url "https://github.com/KynSec/commitguard-kynsec/releases/download/v3.4.2/commitguard_kynsec-3.4.2.tar.gz"
  sha256 "40ee44083f2ea3a69df3838de8d097409da95a692c31658be3d216d152af2151"
  license "Apache-2.0"

  depends_on "python@3.12"
  depends_on "git"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Commit Guard", shell_output("#{bin}/commit-guard --version")
  end
end
