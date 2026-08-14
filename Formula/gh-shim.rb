class GhShim < Formula
  desc "Show inline review threads in gh pr view comments"
  homepage "https://github.com/kkkiio/gh-shim"
  url "https://github.com/kkkiio/gh-shim/releases/download/v0.1.0/gh-shim-0.1.0-darwin-arm64.tar.gz"
  sha256 "9520abecd9abc760348dc4733b35cf706b6e8c18ea47b232b87b6bfe92b8a3ee"
  license "Apache-2.0"
  head "https://github.com/kkkiio/gh-shim.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on "gh"
  depends_on :macos

  def install
    if build.head?
      moon = Pathname(Dir.home)/".moon/bin/moon"
      odie <<~EOS unless moon.executable?
        MoonBit is required for a HEAD installation.
        Install it from https://www.moonbitlang.com/download/ and retry.
      EOS
      system moon, "install", "--bin", bin, "./cmd/gh-shim"
    else
      bin.install "gh-shim"
    end
  end

  test do
    assert_match "gh version", shell_output("#{bin}/gh-shim --version")
  end
end
