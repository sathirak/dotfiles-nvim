return {{
    "telescope.nvim",
    dependencies = {"nvim-telescope/telescope-file-browser.nvim"},
    keys = {{
        "<leader>fx",
        function()
            local telescope = require("telescope")

            local function telescope_buffer_dir()
                return vim.fn.expand("%:p:h")
            end

            telescope.extensions.file_browser.file_browser({
                path = telescope_buffer_dir(),
                cwd = telescope_buffer_dir(),
                cwd_to_path = true,
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = "insert",
                layout_config = {
                    height = 40
                }
            })
        end,
        desc = "Open File Browser"
    }},
    config = function(_, opts)
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions

        opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
            wrap_results = true,
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "bottom"
            },
            sorting_strategy = "ascending",
            winblend = 0,
            mappings = {
                n = {}
            }
        })
        opts.pickers = {
            diagnostics = {
                theme = "ivy",
                initial_mode = "insert",
                layout_config = {
                    preview_cutoff = 9999
                }
            }
        }
        opts.extensions = {
            file_browser = {
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true
            }
        }

        require"telescope".setup {
            defaults = {
                preview = false
            }
        }

        telescope.setup(opts)
        require("telescope").load_extension("file_browser")
    end
}}
