return {
-- :Blender - Open the Blender.nvim UI
-- :BlenderLaunch - Launch a Blender profile
-- :BlenderManage - Manage a running Blender task
-- :BlenderReload - Reload the Blender add-on
-- :BlenderWatch - Watch for changes and reload the add-on
-- :BlenderUnwatch - Stop watching for changes
    "b0o/blender.nvim",
    config = function()
        require("blender").setup()
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "grapp-dev/nui-components.nvim",
        "mfussenegger/nvim-dap",           -- Optional, for debugging with DAP
        "LiadOz/nvim-dap-repl-highlights", -- Optional, for syntax highlighting in the DAP REPL
    },
}
