cask "agents-pixel-dungeon" do
  version "2.5.1"
  sha256 "37bed827e7e3376813224df2cdb130c12f1c973359b6707e38b2b95585ad35ef"

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
