class Mat < Formula
  desc "Read-only TUI monitor for the multi-agent-starter system"
  homepage "https://github.com/netwaif/mat"
  url "https://github.com/netwaif/mat/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1c1f08533a87bc3a7345f4cb236256c0aad0b7a50168423c3ff67e335aca864b"
  license "MIT"
  head "https://github.com/netwaif/mat.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # mat launches a fullscreen TUI and has no --version flag,
    # so just assert the binary was built and is executable.
    assert_predicate bin/"mat", :executable?
  end
end
