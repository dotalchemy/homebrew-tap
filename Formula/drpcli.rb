# SPDX-License-Identifier: Apache-2.0

class Drpcli < Formula
  desc "Digital Rebar CLI"
  homepage "https://rackn.com/rebar/"

  on_macos do
    on_arm do
      url "https://s3-us-west-2.amazonaws.com/rebar-catalog/drpcli/v4.12.8/arm64/darwin/drpcli"
      sha256 "75f8405964f561559f732730c032f0dffee0028fa3531d3bb38741f63e9cbb2f"
    end
    on_intel do
      url "https://s3-us-west-2.amazonaws.com/rebar-catalog/drpcli/v4.12.8/amd64/darwin/drpcli"
      sha256 "dc4e880355a99f0f8c07a9c8c851793b1b3483c64adf92f0692fc803286871e3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3-us-west-2.amazonaws.com/rebar-catalog/drpcli/v4.12.8/arm64/linux/drpcli"
      sha256 "d6268d13ff1f124b6247eb2d96b838c83a5ee4568296f25d594103db641857e0"
    end
    on_intel do
      url "https://s3-us-west-2.amazonaws.com/rebar-catalog/drpcli/v4.12.8/amd64/linux/drpcli"
      sha256 "c5f792b044f2bc108b5b6e611f67c22d8224b4d1dff9ead11e175e58658447f5"
    end
  end

  def install
    bin.install "drpcli"
  end

  def post_install
    generate_completions_from_executable(bin/"drpcli", "autocomplete", shell_parameter_format: :none, shells: [:bash])
  end

  test do
    assert_match "Version: v"+version.to_s, shell_output("#{bin}/drpcli version")
  end
end
