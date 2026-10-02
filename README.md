# dalex160/tap

Homebrew tap for [Viji](https://github.com/dalex160/Viji), the menu bar app that lists every icon, including those hidden behind the MacBook notch.

```sh
brew install --cask dalex160/tap/viji
```

Upgrade with `brew upgrade --cask viji`. The cask is updated automatically on every Viji release.

Viji is signed with a stable self-signed certificate, so macOS keeps its Accessibility permission across upgrades. It is not notarized, so the cask removes the quarantine attribute after installing; read [`Casks/viji.rb`](Casks/viji.rb) if you want to check what it does.
