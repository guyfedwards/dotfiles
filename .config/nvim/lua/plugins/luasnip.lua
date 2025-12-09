return {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })

		-- https://github.com/L3MON4D3/LuaSnip/issues/525
		require("luasnip").config.setup({
			region_check_events = "CursorHold,InsertLeave,InsertEnter",
			delete_check_events = "TextChanged,InsertEnter",
		})
	end,
}
