return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		build = "make tiktoken",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = function()
			local select = require("CopilotChat.select")
			return {
				prompts = {
					Explain = {
						prompt = "/COPILOT_EXPLAIN 上記のコードについて、テキストの段落としての説明を書いてください。",
					},
					Tests = {
						prompt = "/COPILOT_TESTS 上記のコードに対して、詳細なユニットテスト関数のセットを書いてください。",
					},
					Fix = {
						prompt = "/COPILOT_FIX このコードには問題があります。バグを修正してコードを書き直してください。",
					},
					Optimize = {
						prompt = "/COPILOT_REFACTOR 選択したコードを最適化して、パフォーマンスと読みやすさを向上させてください。",
					},
					Docs = {
						prompt = "/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。返信は、オリジナルのコードをコメントとしてドキュメントを追加したコードブロックである必要があります。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptにはJSDoc、Pythonにはdocstringsなど）。",
					},
					FixDiagnostic = {
						prompt = "ファイル内の以下の診断問題を解決してください：",
						selection = select.diagnostics,
					},
					Commit = {
						prompt = "変更のためのコミットメッセージをcommitizen規約で書いてください。タイトルは最大50文字で、メッセージは72文字で折り返してください。全体のメッセージをgitcommit言語のコードブロックでラップしてください。",
						selection = select.gitdiff,
					},
					CommitStaged = {
						prompt = "変更のためのコミットメッセージをcommitizen規約で書いてください。タイトルは最大50文字で、メッセージは72文字で折り返してください。全体のメッセージをgitcommit言語のコードブロックでラップしてください。",
						selection = function(source)
							return select.gitdiff(source, true)
						end,
					},
				},
			}
		end,
		keys = {
            -- stylua: ignore
            { "<C-m>", "<cmd>CopilotChatToggle<CR>", desc = "Toggle copilot chat" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "Explain selected code" },
			{ "<leader>ct", "<cmd>CopilotChatTests<CR>", mode = "v", desc = "Generate unit tests for selected code" },
			{ "<leader>cf", "<cmd>CopilotChatFix<CR>", mode = "v", desc = "Fix selected code" },
			{ "<leader>co", "<cmd>CopilotChatOptimize<CR>", mode = "v", desc = "Optimize selected code" },
			{ "<leader>cd", "<cmd>CopilotChatDocs<CR>", mode = "v", desc = "Write documentation for selected code" },
			{ "<leader>cg", "<cmd>CopilotChatFixDiagnostic<CR>", desc = "Fix diagnostic issues in file" },
			{ "<leader>cc", "<cmd>CopilotChatCommit<CR>", desc = "Generate commit message from unstaged changes" },
			{ "<leader>cs", "<cmd>CopilotChatCommitStaged<CR>", desc = "Generate commit message from staged changes" },
		},
	},
}
