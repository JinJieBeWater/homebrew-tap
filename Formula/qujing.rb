class Qujing < Formula
  desc "Ask trusted colleagues through one local MCP endpoint"
  homepage "https://github.com/JinJieBeWater/qujing"

  livecheck do
    skip "Updated by update-qujing.yml"
  end

  if OS.mac?
    # qujing-update: darwin-arm64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.2/qujing-v0.1.2-darwin-arm64.tar.gz"
    sha256 "059cbb497c1b69776982cc05a67c5fff33672d62d1484ae0f19456ecc26c6e92"
  else
    # qujing-update: linux-x64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.2/qujing-v0.1.2-linux-x64.tar.gz"
    sha256 "5dafe77b4916df37beb809ba2cf129368f6df40004d1686f2e604dd1740bd469"
  end

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "qj", "qujing-transport"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/qj --version").strip
    assert_match "Usage: qj", shell_output("#{bin}/qj --help")
    assert_predicate bin/"qujing-transport", :executable?
  end
end
