class Mj < Formula
  desc "Unofficial Midjourney web CLI and MCP server"
  homepage "https://github.com/ehmo/mj"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_arm64.tar.gz"
      sha256 "d77cb90c5283def1544ae17d077864857aabb110c03ace21694e8f686be602a1"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_darwin_amd64.tar.gz"
      sha256 "df3d91216fb8a5c1d190a45d610e616181865d77df78b74d329af226677b30cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_arm64.tar.gz"
      sha256 "67ead7276cd30a68c70a7c66a5c7bef39f9fae8b185937ef2bb5b64ed8cb0f53"
    else
      url "https://github.com/ehmo/mj/releases/download/v0.11.0/mj_0.11.0_linux_amd64.tar.gz"
      sha256 "2a042a48ba471cc97d6ec499eaefd1c5d9899d9c249f341e6d7ba18b0aa5a9a9"
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
