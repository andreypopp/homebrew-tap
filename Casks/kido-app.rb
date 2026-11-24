cask "kido-app" do
  version "0.36.3"
  sha256 "8fdf881087c56b3c41e74886c5b21dde76700cf36d175758d6a218c1c42f7e49"
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
