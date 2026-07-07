cask "claude-monitor" do
  version "1.0.0"
  sha256 "83b4e5cd2c01a4deb76d5003771f74e57f2d7bbe52374a217c4cfb72bdba4a8a"

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
