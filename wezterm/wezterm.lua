local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

local function _merge_tables(table1, table2)
  local result = {}
  -- Insert first table
  for _, v in ipairs(table1) do
    table.insert(result, v)
  end
  -- Insert second table
  for _, v in ipairs(table2) do
    table.insert(result, v)
  end
  return result
end

-- Colorscheme
config.color_scheme = "Rosé Pine (Gogh)"

-- Font rules
config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font_with_fallback({
      family = "JetBrains Mono",
      weight = "ExtraBold",
    }),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font_with_fallback({
      family = "JetBrains Mono",
      weight = "ExtraBold",
      style = "Italic",
    }),
  },
}

-- Disable ligatures
-- Doc: https://wezterm.org/config/font-shaping.html
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- My left option is a hyper-key w/o Shift
-- Ensure that the right option does not send composed key as it might affect keymaps
-- Doc: https://wezterm.org/config/keyboard-concepts.html#macos-left-and-right-option-key
config.send_composed_key_when_right_alt_is_pressed = false

-- Allow ^ to be used with a single keypress.
-- Doc: https://wezterm.org/config/keyboard-concepts.html#macos-left-and-right-option-key
config.use_dead_keys = false

-- Leader Key (similar to tmux)
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

-- Max fps
config.max_fps = 240

-- font_size
config.font_size = 13.0

-- Workspaces
-- Set the domain to provide persistence
-- Doc: https://wezterm.org/multiplexing.html
-- config.unix_domains = {
--   {
--     name = 'unix'
--   }
-- }
-- config.default_gui_startup_args = { 'connect', 'unix' }

-- Keymaps
config.keys = {
  -- Split Horizontally
  {
    key = "_",
    mods = "LEADER|SHIFT",
    action = act.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  -- Split Vertically
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = act.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  -- Close Pane
  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane({
      confirm = false,
    }),
  },
  -- Navigate Panes Left
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  -- Navigate Panes Right
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  -- Navigate Panes Up
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  -- Navigate Panes Down
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  -- Resize
  {
    key = "m",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  -- Swap Panes
  {
    key = "M",
    mods = "LEADER|SHIFT",
    action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
  },
  -- Toggle Pane Zoom
  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  -- Default workspace
  {
    key = "d",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "default" }),
  },
  -- Config workspace
  {
    key = "c",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "config" }),
  },
  -- Derivatives workspace
  {
    key = "1",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "derivatives" }),
  },
  -- econometrics of financial markets workspace
  {
    key = "2",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "econometrics" }),
  },
  -- fixed income workspace
  {
    key = "3",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "fixed_income" }),
  },
  -- numerical methods workspace
  {
    key = "4",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "numerical_methods" }),
  },
  -- risk analysis workspace
  {
    key = "5",
    mods = "LEADER",
    action = act.SwitchToWorkspace({ name = "risk_analysis" }),
  },
  -- Fuzzy find and activate workspaces
  {
    key = "w",
    mods = "LEADER",
    action = act.ShowLauncherArgs({
      flags = "FUZZY|WORKSPACES",
    }),
  },
  -- Prompt workspace name and create new workspace
  {
    key = "W",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Enter name for new workspace" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },
  {
    key = "$",
    mods = "LEADER|SHIFT",
    action = act.PromptInputLine({
      description = "Enter new workspace name",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end
      end),
    }),
  },
}

config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 10 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 10 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 10 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 10 }) },

    -- Cancel the mode by pressing escape
    { key = "Escape", action = "PopKeyTable" },
  },
}

-- Init workspaces on startup
wezterm.on("gui-startup", function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn
  -- in our initial window
  -- args take precedence before running subsequently defined args
  local args = {}
  if cmd then
    args = cmd.args
  end

  -- Default workspace
  local tab, pane, window = mux.spawn_window({
    workspace = "default",
    cwd = wezterm.home_dir,
    args = args,
  })

  -- Config workspace
  local cfg_cwd = wezterm.home_dir .. "/.config"
  local cfg_tab1, cfg_t1_pane1, cfg_window = mux.spawn_window({
    workspace = "config",
    cwd = cfg_cwd,
    args = _merge_tables(args, { "zsh", "-lic", "lazygit;exec zsh" }),
  })
  cfg_tab1:set_title("git")
  local cfg_tab2, cfg_t2_pane1, _ = cfg_window:spawn_tab({})
  cfg_tab2:activate()

  -- Derivatives workspace
  local derivatives_cwd = wezterm.home_dir .. "/dev/classes/qf602_derivatives"
  local derivatives_tab1, derivatives_t1_pane1, derivatives_window = mux.spawn_window({
    workspace = "derivatives",
    cwd = derivatives_cwd,
  })

  -- econometrics of financial markets workspace
  local econometrics_cwd = wezterm.home_dir .. "/dev/classes/qf604_econometrics_of_financial_markets"
  local econometrics_tab1, econometrics_t1_pane1, econometrics_window = mux.spawn_window({
    workspace = "econometrics",
    cwd = econometrics_cwd,
  })

  -- fixed income workspace
  local fixed_income_cwd = wezterm.home_dir .. "/dev/classes/qf605_fixed_income_securities"
  local fixed_income_tab1, fixed_income_t1_pane1, fixed_income_window = mux.spawn_window({
    workspace = "fixed_income",
    cwd = fixed_income_cwd,
  })

  -- numerical methods workspace
  local numerical_methods_cwd = wezterm.home_dir .. "/dev/classes/qf607_numerical_methods"
  local numerical_methods_tab1, numerical_methods_t1_pane1, numerical_methods_window = mux.spawn_window({
    workspace = "numerical_methods",
    cwd = numerical_methods_cwd,
  })

  -- risk analysis workspace
  local risk_analysis_cwd = wezterm.home_dir .. "/dev/classes/qf609_risk_analysis"
  local risk_analysis_tab1, risk_analysis_t1_pane1, risk_analysis_window = mux.spawn_window({
    workspace = "risk_analysis",
    cwd = risk_analysis_cwd,
  })

  -- Set default workspace
  mux.set_active_workspace("default")
end)

-- Show workspace name on the right of tab bar
wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return config
