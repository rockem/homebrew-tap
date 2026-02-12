class Noted < Formula
  desc "A fast, minimal CLI note-taking app with daily notes and Git sync"
  homepage "https://github.com/rockem/noted"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rockem/noted/releases/download/v#{version}/noted-aarch64-apple-darwin.tar.gz"
      sha256 "a661c8bdb48515cc7424ae75a62086b40b461e30299cf6b4338d8c7a834bfb6c"
    else
      url "https://github.com/rockem/noted/releases/download/v#{version}/noted-x86_64-apple-darwin.tar.gz"
      sha256 "a79474a7b7bb2a8541298a150ade17e1b0c92629a19221f6329a41bac01acf6a"
    end
  end

  on_linux do
    url "https://github.com/rockem/noted/releases/download/v#{version}/noted-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe340af2aafa64be2df5d346425a90e0939fcf127ddf8c501d25733a31d3d8c5"
  end

  def install
    bin.install "noted"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/noted --version")
  end
end
