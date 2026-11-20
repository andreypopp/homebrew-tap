cask "kido-app" do
  version "0.36.0"
  sha256 "d238f416229f8acc8cbc99785954b1d569a2036767e046a7cbb9a009bbe729b2"
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
