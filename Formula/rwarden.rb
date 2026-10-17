# typed: false
# frozen_string_literal: true

class Rwarden < Formula
  desc "Unified Edge & L4 Protocol Security Suite CLI"
  homepage "https://routewarden.github.io"
  url "https://github.com/routewarden/cli.git",
      tag:      "v4.5.1",
      revision: "1acc48d3bc356612b19ea9044265ae5861bf46ee"
  version "4.5.1"
  license "MIT"
  head "https://github.com/routewarden/cli.git", branch: "develop"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_match "rwarden version", shell_output("#{bin}/rwarden version")
  end
end
