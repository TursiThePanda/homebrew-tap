cask "droidmount" do
  version "0.1.1"
  sha256 "75390f058dbd9f6543643025b9dccf38d53f4770aac58c63a3118863e6efa981"

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
