-- DuckDB plugin configuration
require("duckdb"):setup()
require("recycle-bin"):setup()
require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)
require("gvfs"):setup({
  which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
  save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
  save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",
  input_position = { "center", y = 0, w = 60 },
  password_vault = "keyring",
  save_password_autoconfirm = true,
})
