cask "whistle-menubar" do
  version "0.4.0"
  sha256 "88c074fa79a7310202a2c3975938e6f719cd814be84cca9da6e073642f65bb15"

  url "https://github.com/viko16/whistle-menubar/releases/download/v#{version}/whistle-menubar-v#{version}-macos-ARM64.zip"
  name "Whistle Menubar"
  desc "Menu bar controls for a local Whistle proxy"
  homepage "https://github.com/viko16/whistle-menubar"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "whistle-menubar.app"

  uninstall quit: "com.viko16.whistle-menubar"
end
