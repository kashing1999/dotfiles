local neorg = require('neorg')
local neorg_callbacks = require('neorg.callbacks')
local neorg_leader = "<leader>" -- You may also want to set this to <Leader>o for "organization"

neorg.setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {}, -- Allows for use of icons
    },
}

-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
-- needs to reevaluate all the bound keys is invoked
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

	-- Map all the below keybinds only when the "norg" mode is active
	keybinds.map_event_to_mode("norg", {
		n = { -- Bind keys in normal mode

			-- Keys for managing TODO items and setting their states
			{ "<leader>od", "core.norg.qol.todo_items.todo.task_done" },
			{ "<leader>ou", "core.norg.qol.todo_items.todo.task_undone" },
			{ "<leader>op", "core.norg.qol.todo_items.todo.task_pending" },
			{ "<leader>o", "core.norg.qol.todo_items.todo.task_cycle" }

		},
	}, { silent = true, noremap = true })

end)
