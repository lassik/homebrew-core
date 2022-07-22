class DetectSecrets < Formula
  include Language::Python::Virtualenv

  desc "Enterprise friendly way of detecting and preventing secrets in code"
  homepage "https://github.com/Yelp/detect-secrets"
  url "https://files.pythonhosted.org/packages/c2/c0/c0eff47622486753163a482abe9b96f83e613b49913e62a54f371db9b1aa/detect_secrets-1.3.0.tar.gz"
  sha256 "a93ef7d141f48a3a6531bc6d4ccf6d022d23bc10afd1e100a91ca9d2c25abb90"
  license "Apache-2.0"
  head "https://github.com/Yelp/detect-secrets.git", branch: "master"

  bottle do
    sha256 cellar: :any,                 arm64_monterey: "b600656e13711e2fb37bbe0aa81446f57d5fa82630e1d7dcd06b510ba037afb6"
    sha256 cellar: :any,                 arm64_big_sur:  "5fdee784b8588e30146daeac21c667c21094a4b9fc9ca1ad46ca60a41f5fea5d"
    sha256 cellar: :any,                 monterey:       "483d2bd7fa7a791cef6d92273d53c40c32055d986f9976eef5d78332d16b47b0"
    sha256 cellar: :any,                 big_sur:        "6d5119239d7729800deff48b69744778bb0678c50a9255b566bf50e8246da7fe"
    sha256 cellar: :any,                 catalina:       "4874a210cf025318376cd160b3cb4edc59833ef0fc4df1b1fd0c26ce5eed07d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e934f192d7a0c5a1b1319056487933350ae1cbe9a91b33bd55532b63ff437b0a"
  end

  depends_on "libyaml"
  depends_on "python@3.10"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/cc/85/319a8a684e8ac6d87a1193090e06b6bbb302717496380e225ee10487c888/certifi-2022.6.15.tar.gz"
    sha256 "84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/93/1d/d9392056df6670ae2a29fcb04cfa5cee9f6fbde7311a1bb511d4115e9b7a/charset-normalizer-2.1.0.tar.gz"
    sha256 "575e708016ff3a5e3681541cb9d79312c416835686d054a23accb873b254f413"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436/idna-3.3.tar.gz"
    sha256 "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844/PyYAML-6.0.tar.gz"
    sha256 "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724/requests-2.28.1.tar.gz"
    sha256 "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/25/36/f056e5f1389004cf886bb7a8514077f24224238a7534497c014a6b9ac770/urllib3-1.26.10.tar.gz"
    sha256 "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "ArtifactoryDetector", shell_output("#{bin}/detect-secrets scan --list-all-plugins 2>&1")
  end
end
