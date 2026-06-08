class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.1/mj_0.11.1_darwin_arm64.tar.gz"
      sha256 "9590da7c39e9236b2b31bff500da482c9e36f2fe1fdd698a6b7463d9a0aa3de1"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.1/mj_0.11.1_darwin_amd64.tar.gz"
      sha256 "5f5770ef58e6a09a6d3e09c28f49d49143a36cdfa111bf55b147f14e57dabe8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.1/mj_0.11.1_linux_arm64.tar.gz"
      sha256 "45c97be754f3ad77b8363a55b24b958dd153968e3f61f111ae6e2ec5652fc188"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.1/mj_0.11.1_linux_amd64.tar.gz"
      sha256 "c9c659200ed30bcb0b8f96796ccdd33aa1879912902f8f2645b595d180f742ab"
    end
  end

  def install
    bin.install "mj"
    bin.install "mj-mcp"
  end

  def caveats
    <<~EOS
      mj automates Midjourney, which their Terms of Service prohibit. Use your OWN
      account, at low volume. First run downloads a managed Camoufox browser.

      Get started:
        mj doctor
        mj login --i-understand
    EOS
  end

  test do
    assert_match "mj #{version}", shell_output("#{bin}/mj version")
  end
end
