-- デフォルトの設定を読み込む
require("codegpt.config")

-- 設定を上書き
vim.g["codegpt_commands_defaults"] = {
	["explain"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} コードについて説明してください: ```{{filetype}}\n{{text_selection}}``` あたかも他の開発者に説明するように説明してください。",
		callback_type = "text_popup",
	},
	["question"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} コードについて質問があります: ```{{filetype}}\n{{text_selection}}``` {{command_args}}",
		callback_type = "text_popup",
	},
	["debug"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} にバグがないか解析してください。返答は日本語で出力してください: ```{{filetype}}\n{{text_selection}}```",
		callback_type = "text_popup",
	},
	["doc"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} コードがあります: ```{{filetype}}\n{{text_selection}}```\n指定された言語のベストプラクティスを使って、本当に良いドキュメントを書いてください。パラメータ、戻り値の型、例外やエラーのドキュメントに注意してください。 {{language_instructions}} コードスニペットだけを返し、他には何も返さないでください。",
		language_instructions = {
			cpp = "関数には doxygen 形式のコメントを使用してください。",
			java = "関数には JavaDoc 形式のコメントを使用してください。",
		},
	},
	["opt"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} コードがあります: ```{{filetype}}\n{{text_selection}}```\nこのコードを最適化してください。 {{language_instructions}} コードスニペットだけを返し、他には何も返さないでください。",
		language_instructions = {
			cpp = "Modern C++ を使用してください。",
		},
	},
	["tests"] = {
		model = "gpt-4-1106-preview",
		user_message_template = "以下の {{language}} コードがあります: ```{{filetype}}\n{{text_selection}}```\n指定された言語のベストプラクティスを使って、本当に良い単体テストを書いてください。 {{language_instructions}} 単体テストだけを返してください。コードスニペットだけを返し、他には何も返さないでください。",
		callback_type = "code_popup",
		language_instructions = {
			cpp = "modern C++ の構文を使用してください。gtest フレームワークを使用した単体テストを生成してください。",
			java = "junit フレームワークを使用した単体テストを生成してください。",
		},
	},
	["chat"] = {
		model = "gpt-4-1106-preview",
		system_message_template = "あなたはソフトウェア開発者の一般的なアシスタントです。",
		user_message_template = "{{command_args}}",
		callback_type = "text_popup",
	},
}

vim.g["codegpt_commands"] = {
	["correct_sentences"] = {
		model = "gpt-4-1106-preview",
		system_message_template = "あなたはプロの校正者です。",
		user_message_template = "```{{text_selection}}```\nこの文章の校正をしてください。校正後の文章だけを返し、他には何も返さないでください。",
		callback_type = "replace_lines",
	},
}
