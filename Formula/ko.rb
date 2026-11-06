class Ko < Formula
  desc "Terminal multiplexer CLI and server"
  homepage "https://github.com/andreypopp/kido"
  url "https://github.com/andreypopp/kido.git",
      revision: "f2755682c112759307e752e24b1f7ac4efe95aa7"
  version "0.1.0"
  head "https://github.com/andreypopp/kido.git", branch: "main"

  depends_on "rustup" => :build

  # Toolchains and Cargo dependencies need network access during the build.
  # HOMEBREW_CACHE is writable in the sandbox and persists between releases.
  def install
    ENV["RUSTUP_HOME"] = HOMEBREW_CACHE/"ko/rustup"
    ENV["CARGO_HOME"] = HOMEBREW_CACHE/"ko/cargo"
    zig = HOMEBREW_CACHE/"ko/zig-#{Utils.safe_popen_read("scripts/install-zig.sh", "--print-key").strip}"
    system "scripts/install-zig.sh", zig unless (zig/"zig").exist?
    ENV.prepend_path "PATH", zig
    system formula_opt_bin("rustup")/"rustup", "toolchain", "install"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      This is the ko CLI and server for terminals and remote hosts.
      Kido.app bundles its own ko.
    EOS
  end

  test do
    build = JSON.parse(shell_output("#{bin}/ko version")).fetch("build")
    assert_match(/^#{Regexp.escape(stable.specs[:revision][0, 7])}/, build)
    system bin/"ko", "--help"
  end
end
