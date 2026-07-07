# homebrew-tap

Homebrew tap for [Dulguun Tuguldur](https://github.com/dulguun-tuguldur)'s tools.

## Claude Monitor

A native macOS menu bar app showing Claude Code account usage at a glance.

```sh
brew tap dulguun-tuguldur/tap
brew install --cask claude-monitor
```

Claude Monitor is self-signed and not notarized. On first launch macOS
Gatekeeper will refuse to open it — right-click the app in `/Applications`,
choose **Open**, then **Open** again in the dialog (a one-time step per
installed version). See the cask caveats for details.
