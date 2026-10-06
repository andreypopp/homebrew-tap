cask "kido-app" do
  version "0.5.0"
  sha256 "9d31d10a33870232e7f99e104d33a1fdeef7ecf3f511806f4e42fc7ea09885a2"
  url "https://github.com/andreypopp/kido/releases/download/kido-app%2F#{version}/Kido-#{version}.zip"
  name "Kido"
  desc "Native macOS client for the kido tmux agent multiplexer"
  homepage "https://github.com/andreypopp/kido"
  depends_on arch: :arm64
  depends_on macos: :tahoe
  app "Kido.app"
  caveats <<~EOS
    Kido.app is ad-hoc signed, not notarized. Upgrades require relaunching the app
    and confirming a restart of its separate app server. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Kido.app"
  EOS
end
