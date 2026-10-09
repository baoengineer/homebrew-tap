class Byom < Formula
  desc "Bring your own model to Claude Code: every model you can sign in to, in one session"
  homepage "https://baoengineer.github.io/byom/"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/baoengineer/byom/releases/download/v0.4.2/byom-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "d92a756de2a1536e0360475ca1aa70f636bf40c1e0e33fb793c3ddf91ba17f43"
    else
      url "https://github.com/baoengineer/byom/releases/download/v0.4.2/byom-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "c78d1530679abb9d6fa114a65cc78be48d82939bc6cf9b236328f20c5e29d00a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/baoengineer/byom/releases/download/v0.4.2/byom-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "545367e7fb63cc0646ec0162cb2a2c94ff10c9068c750ab1d9e1407041a89581"
    else
      url "https://github.com/baoengineer/byom/releases/download/v0.4.2/byom-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e53bce6b25b8ea2640ec1750939137739518d364d1cade40a34eefa6cdd30c8"
    end
  end

  def install
    bin.install "byom"
  end

  def caveats
    <<~EOS
      byom starts the official Claude Code (`claude`), which you install separately:
        https://code.claude.com/docs/en/setup
      Then: byom login, and byom.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/byom --version")
  end
end
