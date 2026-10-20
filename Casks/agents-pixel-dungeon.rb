cask "agents-pixel-dungeon" do
  version "2.4.0"
  sha256 "ef2572e3682fcbfb46386a7d807749108dd1a83b4b833cbfd17ba7d136d10ec4"

  url "https://github.com/JoseValencia125/agents-pixel-dungeon/releases/download/v#{version}/Agents-Pixel-Dungeon-macOS.zip"
  name "Agents Pixel Dungeon"
  desc "Native pixel-art guild for your live Herdr coding agents"
  homepage "https://github.com/JoseValencia125/agents-pixel-dungeon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agents Pixel Dungeon.app"
  # The guild's command line and MCP server (`agents-pixel-dungeon-guild mcp`).
  binary "#{appdir}/Agents Pixel Dungeon.app/Contents/MacOS/agents-pixel-dungeon-guild"

  zap trash: [
    "~/Library/Application Support/agents-pixel-dungeon",
    "~/Library/Preferences/io.github.josevalencia125.agents-pixel-dungeon.plist",
  ]

  caveats do
    <<~EOS
      The app watches the agents of Herdr (brew install herdr) and has a
      viewer mode without it.
    EOS
  end
end
