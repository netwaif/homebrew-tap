class Mat < Formula
  desc "Read-only TUI monitor for the multi-agent-starter system"
  homepage "https://github.com/netwaif/mat"
  url "https://github.com/netwaif/mat/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8af4df4d133eab4ea771d9130c189dffdc4499e0d399ecbbb87be23d02bb6168"
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
