class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_arm64.tar.gz"
      sha256 "25d421bbe4adfe9c4381d1d8c05a75b5caf2dc2236b8da02222662b5cab1ac50"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_amd64.tar.gz"
      sha256 "2f00385cb4539781d0af008f4066bfbe66040b77f4438b9068798bf48321f6a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_arm64.tar.gz"
      sha256 "954ffa0ed977a9806149a71c8372e588f6c9397bc5392526bca6e7714a17a1a4"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_amd64.tar.gz"
      sha256 "a2116cde841b37d1b5264562c54906c2d5adaa7e229153f0d68c05e96a936e56"
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
