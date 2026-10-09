class Byom < Formula
  desc "Bring your own model to Claude Code: every model you can sign in to, in one session"
  homepage "https://baoengineer.github.io/byom/"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/baoengineer/byom/releases/download/v0.4.1/byom-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "22efd9f21d0b60f8492d7d8a42c913279a8ed506bf212586d718a39d07efaac8"
    else
      url "https://github.com/baoengineer/byom/releases/download/v0.4.1/byom-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "5568d269a64ac4fab608d5cae6b6dd20395fea77bb3d938741694f7af0cdaf29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/baoengineer/byom/releases/download/v0.4.1/byom-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5511e3153201a6bb70570964693375346e3a019f1758c3bd6690283c7404cd8"
    else
      url "https://github.com/baoengineer/byom/releases/download/v0.4.1/byom-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9233df7d4db65e6a0d0540bf8316f52b5983cf334f421d1eb4a9746fc6bf64c"
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
