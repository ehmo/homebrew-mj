class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_arm64.tar.gz"
      sha256 "3d66f5e6fe3a031fde1829ab83d68ceffff775c5632013631869fb002da98528"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_amd64.tar.gz"
      sha256 "2d26bc36b9a1854337e362384b75884019922a49e7abb669006432f116c62784"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_arm64.tar.gz"
      sha256 "ec597b68c8d61187ffeebe6d37db4882888fa0dde6a2b1eccb3986887aa48c7c"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_amd64.tar.gz"
      sha256 "0910365fcbac90e0db436a11f7d272e927623ea881d3c93cd58ebeb4bdea6712"
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
