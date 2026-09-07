class Qujing < Formula
  desc "Ask trusted colleagues through one local MCP endpoint"
  homepage "https://github.com/JinJieBeWater/qujing"

  livecheck do
    skip "Updated by update-qujing.yml"
  end

  if OS.mac?
    # qujing-update: darwin-arm64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.2.0/qujing-v0.2.0-darwin-arm64.tar.gz"
    sha256 "436df2f2bfb66e7ff4a466fec17ab6cbe852a7178b963fe028a110d6e77320a0"
  else
    # qujing-update: linux-x64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.2.0/qujing-v0.2.0-linux-x64.tar.gz"
    sha256 "45745e5567fe3f44f4262f4f49cce0352a3a5f30efad669d7554ce482edf27d2"
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
