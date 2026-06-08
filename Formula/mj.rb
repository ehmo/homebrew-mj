class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_arm64.tar.gz"
      sha256 "4baa7be598e9c977f1852ccaaf08fbfd6ae437cd801b55b7d5dd1b57a8e7bed2"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_amd64.tar.gz"
      sha256 "c5e4928ec2712307c8202a4c63a2caa68029c08f4aedf99027bbc25e3e4295b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_arm64.tar.gz"
      sha256 "cbe528f9fd2055c7df68f0ea203f351f4930ec0f9fe228939c3e630c5817aa12"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_amd64.tar.gz"
      sha256 "1eb48db89b29c022e06e66b2922602332bb8f936faca3ae34b7731a9416c919d"
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
