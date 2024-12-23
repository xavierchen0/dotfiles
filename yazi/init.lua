require("full-border"):setup()

require("folder-rules"):setup()

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false },
	persist = "vim",
	desc_format = "full",
	file_pick_mode = "hover",
	notify = {
		enable = true,
		timeout = 2,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
