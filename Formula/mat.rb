class Mat < Formula
  desc "Read-only TUI monitor for the multi-agent-starter system"
  homepage "https://github.com/netwaif/mat"
  url "https://github.com/netwaif/mat/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "d60a6fe10e2cc4278756afc33ddb80b99712664f5e2beb5f93e6b6d0dea2b72b"
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
