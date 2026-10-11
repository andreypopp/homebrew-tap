cask "kido-app" do
  version "0.15.1"
  sha256 "1b7e3ecfd1e2933972da9c551caf1d04af188314e46ee832e7730260e5c0f0ba"
  url "https://github.com/andreypopp/kido/releases/download/kido-app%2F#{version}/Kido-#{version}.zip"
  name "Kido"
  desc "Native macOS client for the kido tmux agent multiplexer"
  homepage "https://github.com/andreypopp/kido"
  depends_on arch: :arm64
  depends_on macos: :tahoe
  app "Kido.app"
  caveats <<~EOS
    Kido.app is Apple Development (Personal Team) signed, not notarized.
    Upgrades require relaunching the app
    and confirming a restart of its separate app server. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Kido.app"
  EOS
end
