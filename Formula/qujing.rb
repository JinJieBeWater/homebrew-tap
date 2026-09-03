class Qujing < Formula
  desc "Ask trusted colleagues through one local MCP endpoint"
  homepage "https://github.com/JinJieBeWater/qujing"

  livecheck do
    skip "Updated by update-qujing.yml"
  end

  if OS.mac?
    # qujing-update: darwin-arm64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.1/qujing-v0.1.1-darwin-arm64.tar.gz"
    sha256 "872ee6d5d9ece8b61a3534d15cf9835c267e23b058927581e1f1a46cd83e964d"
  else
    # qujing-update: linux-x64
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.1/qujing-v0.1.1-linux-x64.tar.gz"
    sha256 "a1223f939a689079b30e14bb5f530213b0beab7315523847b0934c68f083d5d2"
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
