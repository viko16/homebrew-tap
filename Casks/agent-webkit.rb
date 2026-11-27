cask "agent-webkit" do
  version "0.2.5"
  sha256 "81f89fc9b6c18223666a78103aaa709ec4f6a8eb5909fc2569643b7f5d05268c"

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
