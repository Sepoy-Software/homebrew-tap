class Bigjsonl < Formula
  desc "Fast viewer for large JSONL files with syntax highlighting"
  homepage "https://github.com/rajibsingh/bigjsonl"
  url "https://github.com/rajibsingh/bigjsonl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "62f0c77a67ba810603bad75a9ca574573b1bdfb865efd2fc1a09d566e78dfbda"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos => :sequoia

  def install
    system "swift", "build", "-c", "release", "--product", "bigjsonl",
           "--disable-sandbox"
    bin.install ".build/release/bigjsonl"
  end

  test do
    (testpath/"test.jsonl").write("{\"hello\":\"world\"}\n")
    output = shell_output("#{bin}/bigjsonl #{testpath}/test.jsonl --no-color --line 1")
    assert_match "hello", output
  end
end
