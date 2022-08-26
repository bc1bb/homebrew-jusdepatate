# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Infosh < Formula
  desc "Get details about your system"
  homepage "https://github.com/jusdepatate/info.sh/"
  url "https://github.com/jusdepatate/info.sh/archive/3b569bf550428c57cb4b3bdb83ffb82b865bbbda.zip"
  version "3b569bf"
  sha256 "cc11dda4f8f2ac57b17e4110bf0929c689c4a5724b8b4871e8be8fc46a2040ac"
  license "GPL-3.0-only"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    bin.install "info_rewrite.sh" => "info.sh"
  end

  test do
    system "info.sh", "--verbose"
  end
end
