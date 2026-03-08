cask "agent-orchestrator" do
  version "0.1.0"
  sha256 "55cd6c7084e297a81937f4666ff8c3f25465cbc561b6a0a4189fffa0c0f9f1df"

  url "https://github.com/formatho/agent-orchestrator/releases/download/v#{version}/Agent-Orchestrator-#{version}.dmg"
  name "Agent Orchestrator"
  desc "Desktop app for managing AI agents, TODOs, and cron jobs"
  homepage "https://github.com/formatho/agent-orchestrator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Agent Orchestrator.app"

  zap trash: [
    "~/Library/Application Support/Agent Orchestrator",
    "~/Library/Caches/Agent Orchestrator",
    "~/Library/Preferences/com.formatho.agent-orchestrator.plist",
    "~/Library/Saved Application State/com.formatho.agent-orchestrator.savedState",
  ]
end
