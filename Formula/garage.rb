class Garage < Formula
  desc "A keyboard-driven macOS TUI cockpit for your dev projects."
  homepage "https://github.com/dulguun-tuguldur/garage"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dulguun-tuguldur/garage/releases/download/v0.1.3/garage-aarch64-apple-darwin.tar.xz"
      sha256 "6736c29af304bf2079497cdd6784e0ee340ad2ade210e7064b37f353813176c2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dulguun-tuguldur/garage/releases/download/v0.1.3/garage-x86_64-apple-darwin.tar.xz"
      sha256 "9021811a273b640dedceeafb88ef2f80d76fd4555db00a2aa2666c7bf1e21438"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "garage"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "garage"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
