cask "agent-webkit" do
  version "0.2.2"
  sha256 "6f8db517d9e723d06be3b5c4401963eadccc81342f5bf4250e2aa369d858f22f"

  url "https://github.com/viko16/agent-webkit/releases/download/v#{version}/AgentWebKit-v#{version}-macos-arm64.zip"
  name "Agent WebKit"
  desc "Native browser for local AI agents"
  homepage "https://github.com/viko16/agent-webkit"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Agent WebKit.app"
  binary "#{appdir}/Agent WebKit.app/Contents/MacOS/awb"

  uninstall quit: "local.agent-webkit.browser"
end
