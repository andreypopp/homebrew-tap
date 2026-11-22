cask "kido-app" do
  version "0.36.2"
  sha256 "4126ef5aa0285c265d842e4d24397cd1775f25427a803d40f604345d8c78f388"
  url "https://github.com/andreypopp/kido/releases/download/kido-app%2F#{version}/Kido-#{version}.zip"
  name "Kido"
  desc "Native macOS client for the ko agent terminal server"
  homepage "https://github.com/andreypopp/kido"
  depends_on arch: :arm64
  depends_on macos: :golden_gate
  app "Kido.app"
  caveats <<~EOS
    Kido.app is Apple Development (Personal Team) signed, not notarized.
    Upgrades require relaunching the app
    and can require a restart of the shared local ko server.
    A restart stops all its sessions, commands and agents. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Kido.app"
  EOS
end
