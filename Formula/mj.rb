class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_arm64.tar.gz"
      sha256 "6b30efb169205177c21be116b03de61ccc0c7190dcc6fa460538293793ee773c"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_amd64.tar.gz"
      sha256 "54143cc703529243a9b5150c8d1813e78913ae564acd3b033d1d69b3e877dcb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_arm64.tar.gz"
      sha256 "a31eeee6eee33d26d80ecc1805939edaed717e8b9062ef2ab1877123b6fff2cc"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_amd64.tar.gz"
      sha256 "ddca1fb9463798781a2e484a29a95ff989a1bc321169c5eb2b7a67cdc25d444b"
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
