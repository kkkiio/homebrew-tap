class Agconf < Formula
  desc "Copy AI agent skills and prompts from local paths or GitHub"
  homepage "https://github.com/kkkiio/agconf"
  license "Apache-2.0"
  head "https://github.com/kkkiio/agconf.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    if build.head?
      moon = Pathname(Dir.home)/".moon/bin/moon"
      odie <<~EOS unless moon.executable?
        MoonBit is required for a HEAD installation.
        Install it from https://www.moonbitlang.com/download/ and retry.
      EOS
      system moon, "install", "--bin", bin, "."
    else
      bin.install "agconf"
    end
  end

  test do
    assert_match "Usage: agconf", shell_output("#{bin}/agconf --help")
  end
end
