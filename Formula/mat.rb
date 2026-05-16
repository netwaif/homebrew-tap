class Mat < Formula
  desc "Read-only TUI monitor for the multi-agent-starter system"
  homepage "https://github.com/netwaif/mat"
  url "https://github.com/netwaif/mat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "853f27b7ec435b9150a5201a87509e66da71c4523909c02615182cdecd5814e8"
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
