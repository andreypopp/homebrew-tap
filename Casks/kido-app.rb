cask "kido-app" do
  version "0.1.0"
  sha256 "0b535bfa71c27bbeb7a04be5d6ef05074790d2795f56b38c3d9415bb7adb3ef9"
  url "https://github.com/andreypopp/kido/releases/download/kido-app%2F#{version}/Kido-#{version}.zip"
  name "Kido"
  desc "Native macOS client for the kido tmux agent multiplexer"
  homepage "https://github.com/andreypopp/kido"
  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"
  depends_on formula: "andreypopp/tap/kido"
  app "Kido.app"
  caveats <<~EOS
    Kido.app is not signed or notarized. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Kido.app"
  EOS
end
