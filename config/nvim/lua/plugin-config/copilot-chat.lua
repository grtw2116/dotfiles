-- Copilot Chatウィンドウを開く
vim.keymap.set({ "n", "v" }, "<C-m>", ":CopilotChatToggle<CR>", { noremap = true, silent = true })

-- 選択したコードについて説明させる
vim.keymap.set({ "n", "v" }, "<leader>ce", ":CopilotChatExplain<CR>", { noremap = true, silent = true })

-- 選択したコードの単体テストを生成する
vim.keymap.set({ "n", "v" }, "<leader>ct", ":CopilotChatTests<CR>", { noremap = true, silent = true })

-- 選択したコードのバグを修正させる
vim.keymap.set({ "n", "v" }, "<leader>cf", ":CopilotChatFix<CR>", { noremap = true, silent = true })

-- 選択したコードのバグを読みやすくする
vim.keymap.set({ "n", "v" }, "<leader>co", ":CopilotChatOptimize<CR>", { noremap = true, silent = true })

-- 選択したコードのドキュメントを書かせる
vim.keymap.set({ "n", "v" }, "<leader>cd", ":CopilotChatDocs<CR>", { noremap = true, silent = true })

-- エラーに基づき選択したコードを修正させる
vim.keymap.set({ "n", "v" }, "<leader>cg", ":CopilotChatFixDiagnostic<CR>", { noremap = true, silent = true })

-- 差分を元にコミットメッセージを生成する
vim.keymap.set({ "n", "v" }, "<leader>cc", ":CopilotChatCommit<CR>", { noremap = true, silent = true })

-- ステージ済みの差分を元にコミットメッセージを生成する
vim.keymap.set({ "n", "v" }, "<leader>cs", ":CopilotChatCommitStaged<CR>", { noremap = true, silent = true })

-- その場で質問する
vim.keymap.set({ "n", "v" }, "<leader>qc", function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask("Quick Chat", { selection = require("CopilotChat.select").buffer })
	end
end, { noremap = true, silent = true })

local select = require("CopilotChat.select")

require("CopilotChat").setup({
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
})
