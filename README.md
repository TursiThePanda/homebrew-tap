# TursiThePanda's Homebrew tap

```sh
brew tap tursithepanda/tap
brew trust --cask tursithepanda/tap/droidmount   # Homebrew asks you to trust third-party casks once
brew install --cask tursithepanda/tap/droidmount
```

| Cask | What it is |
|---|---|
| [droidmount](Casks/droidmount.rb) | [Droidmount](https://github.com/TursiThePanda/droidmount) — Android phones as Finder disks (installs macFUSE too) |

Droidmount is not in Homebrew's main cask repository because that only accepts apps
signed and notarized with a paid Apple developer account.
