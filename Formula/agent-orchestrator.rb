class AgentOrchestrator < Formula
  desc "Backend server for Agent Orchestrator - Multi-agent coordination platform"
  homepage "https://github.com/formatho/agent-orchestrator"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/formatho/agent-orchestrator/releases/download/v#{version}/agent-orchestrator-server-darwin-amd64"
      sha256 "3bd90193ba955df33cc8660fc0562d85eff4c61737a43e31858d4e4d303feba5"
    end
    on_arm do
      url "https://github.com/formatho/agent-orchestrator/releases/download/v#{version}/agent-orchestrator-server-darwin-arm64"
      sha256 "e2505e1152f19d17e1df033c0a400948e005aa51fb8901bb7885bf2e4ad346e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/formatho/agent-orchestrator/releases/download/v#{version}/agent-orchestrator-server-linux-amd64"
      sha256 "1b32365813c5ccba11796fd1302266c685e155f697aa69d0865b955652666918"
    end
    on_arm do
      url "https://github.com/formatho/agent-orchestrator/releases/download/v#{version}/agent-orchestrator-server-linux-arm64"
      sha256 "dae0f1ad219b7a773d7f890a1f3a957286da2e0721a1cc9916319f90dfa63530"
    end
  end

  def install
    binary_name = "agent-orchestrator-server-#{OS.kernel_name.downcase}-#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
    bin.install binary_name => "agent-orchestrator-server"
  end

  test do
    system "#{bin}/agent-orchestrator-server", "--help"
  rescue
    # Server might not have --help, just check it runs
    system "#{bin}/agent-orchestrator-server", "version"
  end
end
