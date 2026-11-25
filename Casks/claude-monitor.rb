cask "claude-monitor" do
  version "1.2.0"
  sha256 "761571fd2968ac0404626d3fff77f541a32c65767cf9d1f2504d57c0312ceb94"

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
