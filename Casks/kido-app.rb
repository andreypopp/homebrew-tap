cask "kido-app" do
  version "0.36.1"
  sha256 "9f1d52f1bca72a8876909119ee968a9db2be619f3dbf9348b0b6807c8578e93b"
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
