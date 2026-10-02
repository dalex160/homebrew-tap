cask "viji" do
  version "1.1.2"
  sha256 "eacf86cabad590bf9361cfa5438b5e951821b282cef50be86dfa696405b6e016"

  url "https://github.com/dalex160/Viji/releases/download/v#{version}/Viji.zip"
  name "Viji"
  desc "Lists every menu bar icon, including those hidden behind the notch"
  homepage "https://github.com/dalex160/Viji"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Viji.app"

  # Viji is signed with a self-signed certificate, not notarized: clear the quarantine
  # so Gatekeeper doesn't block it after each install or upgrade.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Viji.app"]
  end

  uninstall quit: "com.alexisdahan.Viji"

  zap trash: "~/Library/Preferences/com.alexisdahan.Viji.plist"

  caveats <<~EOS
    Grant Viji Accessibility access when macOS asks, then Cmd-drag the eye
    next to the battery icon. The permission is kept across upgrades.

    If you installed Viji before with the one-liner or build.sh, delete
    ~/Applications/Viji.app to avoid having two copies.
  EOS
end
