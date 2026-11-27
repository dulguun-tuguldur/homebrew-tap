cask "claude-monitor" do
  version "1.3.1"
  sha256 "cdfe879c4dd24bab1fda972f36f089f99e6b05b9ae950d329f42bb1d97957828"

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
