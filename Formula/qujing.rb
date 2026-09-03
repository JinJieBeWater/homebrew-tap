class Qujing < Formula
  desc "Ask trusted colleagues through one local MCP endpoint"
  homepage "https://github.com/JinJieBeWater/qujing"

  if OS.mac?
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.0/qujing-v0.1.0-darwin-arm64.tar.gz"
    sha256 "231e737a637e46b87884f8e04f1a090af3a907f9c20ac97e1bc60bdcb276863e"
  else
    url "https://github.com/JinJieBeWater/qujing/releases/download/v0.1.0/qujing-v0.1.0-linux-x64.tar.gz"
    sha256 "a58b70d32c7f94bd03271fdff6be873b301e3ddccb5dd438f08c223e69830c36"
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
