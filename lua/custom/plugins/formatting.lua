return {
  'stevearc/conform.nvim',
  event = {"BuFReadPre", "BufNewFile"},
  config = function ()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        python = {"black"},
	javascript = {"prettier"},
	html = {"prettier"},
	css = {"prettier"},
      },
      format_on_save = {
	lsp_fallback = true,
	timeout_ms = 500,
      },
    })
      vim.keymap.set({ "n", "v"}, "<leader>mp", function ()
	conform.format({
	  lsp_fallback = true,
	  timeout_ms = 500
	})
      end, {desc = "Format file or range (in visual mode)"})
    end
}
