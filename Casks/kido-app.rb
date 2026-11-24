cask "kido-app" do
  version "0.36.4"
  sha256 "004a9046e4f3ecb5594880ad4ba4a32434dee74e090c0175e9391ba45cb9d2b2"
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
