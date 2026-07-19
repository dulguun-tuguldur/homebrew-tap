cask "claude-monitor" do
  version "1.1.0"
  sha256 "e3688696efbe7510c58d2a46fda373817d62602cfb13b38f4b4c28a79e5f4f18"

  url "https://github.com/dulguun-tuguldur/claude-monitor/releases/download/v#{version}/ClaudeMonitor-#{version}.zip"
  name "Claude Monitor"
  desc "Menu bar app showing Claude Code account usage at a glance"
  homepage "https://github.com/dulguun-tuguldur/claude-monitor"

  depends_on macos: :ventura

  app "Claude Monitor.app"

  zap trash: "~/Library/Preferences/mn.tanasoft.claude-monitor.settings.plist"

  caveats <<~EOS
    Claude Monitor is self-signed and not notarized, so on first launch macOS
    Gatekeeper will refuse to open it. To open it the first time:
      - Right-click "Claude Monitor" in /Applications, choose Open, then Open
        again in the dialog; or
      - System Settings > Privacy & Security > "Open Anyway".
    This is a one-time step per installed version.
  EOS
end
