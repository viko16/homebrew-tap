cask "agent-webkit" do
  version "0.2.3"
  sha256 "f7c59538a77eca35a3001fac90dcb4f763a63dad12063ae319c38dea1d1076f4"

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
