local is_ok, neorg = pcall(require, "neorg")
if not is_ok then
  return
end

local work_dir = os.getenv("NEORG_WORK_DIR")
local home_dir = os.getenv("NEORG_HOME_DIR")
local english_dir = os.getenv("NEORG_ENGLISH_DIR")

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.summary"] = {},
        ["core.syntax"] = {},
        ["core.dirman"] = {
            config = {
              workspaces = {
                  work = work_dir,
                  home = home_dir,
                  english = english_dir,
              }
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode"
            }
        },
    },
}
