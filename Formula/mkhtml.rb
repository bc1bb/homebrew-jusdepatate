# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mkhtml < Formula
  desc "Simple static site generator"
  homepage "https://github.com/jusdepatate/mkhtml/"
  url "https://github.com/jusdepatate/mkhtml/archive/refs/tags/v3.3.1.tar.gz"
  version "3.3.1"
  sha256 "8153ed543eca474d7f169836e68d0ee813b8825546cf9558026588314a304484"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "mkdir", testpath/"parts"
    system "mkdir", testpath/"pages"
    system "mkdir", testpath/"static"
    system "mkdir", testpath/"build"

    (testpath/"parts/header.html").write("<html><head><link rel=\"stylesheet\" href=\"static/style.css\"></head><body>")
    (testpath/"pages/index.html").write("<p>Lorem Ipsum</p>")
    (testpath/"parts/footer.html").write("</body></html>")
    (testpath/"static/style.css").write("body { background-color: red; }")

    system "mkhtml", "b", "--parts-dir", testpath/"parts", "--pages-dir", testpath/"pages", "--static-dir", testpath/"static", "--build-dir", testpath/"build"

    assert_predicate testpath/"build/index.html", :exist?
    assert_predicate testpath/"build/static/style.css", :exist?
  end
end
