class Noted < Formula
  desc "A fast, minimal CLI note-taking app with daily notes and Git sync"
  homepage "https://github.com/rockem/noted"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rockem/noted/releases/download/v#{version}/noted-aarch64-apple-darwin.tar.gz"
      sha256 "${SHA_MACOS_ARM}"
    else
      url "https://github.com/rockem/noted/releases/download/v#{version}/noted-x86_64-apple-darwin.tar.gz"
      sha256 "${SHA_MACOS_X86}"
    end
  end

  on_linux do
    url "https://github.com/rockem/noted/releases/download/v#{version}/noted-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "${SHA_LINUX}"
  end

  def install
    bin.install "noted"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/noted --version")
  end
end
