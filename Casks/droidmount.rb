cask "droidmount" do
  version "0.1.2"
  sha256 "9692e2dc4072a4332caec804fb1768b57faa1a806f64ea9e14591685963d87d2"

  url "https://github.com/TursiThePanda/droidmount/releases/download/v#{version}/Droidmount-#{version}.dmg"
  name "Droidmount"
  desc "Mount Android phones as Finder disks"
  homepage "https://github.com/TursiThePanda/droidmount"

  # Git tags, not "latest release": GitHub leaves pre-releases out of the latter.
  livecheck do
    url "https://github.com/TursiThePanda/droidmount.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on cask: "macfuse"
  depends_on macos: :tahoe

  app "Droidmount.app"

  uninstall quit: "io.github.tursithepanda.droidmount"

  zap trash: [
    "~/Library/Application Support/Droidmount",
    "~/Library/Caches/io.github.tursithepanda.droidmount",
    "~/Library/HTTPStorages/io.github.tursithepanda.droidmount",
    "~/Library/Logs/Droidmount.log",
    "~/Library/Preferences/io.github.tursithepanda.droidmount.plist",
  ]

  caveats <<~EOS
    Droidmount is not signed with a paid Apple developer certificate. The first time
    you open it, allow it in System Settings > Privacy & Security > Open Anyway.

    macFUSE's file system extension must be enabled once: System Settings > General >
    Login Items & Extensions, switch the list to "By Category", open
    "File System Extensions" and turn on "macFUSE" and "macFUSE (local)".
    Droidmount's setup window walks you through it.
  EOS
end
