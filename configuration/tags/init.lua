local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.brave,
    type = 'brave',
    defaultApp = apps.default.browser,
    screen = 1
  },
  {
    icon = icons.vivaldi,
    type = 'vivaldi',
    defaultApp = apps.default.vivaldi,
    screen = 1
  },
  {
    icon = icons.firefox,
    type = 'firefox',
    defaultApp = apps.default.firefox,
    screen = 1
  },
  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = apps.default.chrome,
    screen = 1
  },
  {
    icon = icons.mail,
    type = 'mail',
    defaultApp = apps.default.mail,
    screen = 1
  },
  {
    icon = icons.vm,
    type = 'vm',
    defaultApp = apps.default.vm,
    screen = 1
  },
  {
    icon = icons.pdf,
    type = 'pdf',
    defaultApp = apps.default.pdf,
    screen = 1
  },
  {
    icon = icons.trading,
    type = 'trading',
    defaultApp = apps.default.trading,
    screen = 1
  },
  {
    icon = icons.kodi,
    type = 'kodi',
    defaultApp = apps.default.kodi,
    screen = 1
  },
  {
    icon = icons.slack,
    type = 'slack',
    defaultApp = apps.default.slack,
    screen = 1
  },
  {
    icon = icons.discord,
    type = 'discord',
    defaultApp = apps.default.discord,
    screen = 1
  },
  {
    icon = icons.steam,
    type = 'steam',
    defaultApp = apps.default.steam,
    screen = 1
  },
  {
    icon = icons.game,
    type = 'game',
    defaultApp = apps.default.game,
    screen = 1
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = apps.default.editor,
    screen = 2
  },
  {
    icon = icons.social,
    type = 'social',
    defaultApp = apps.default.social,
    screen = 2
  },
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = apps.default.files,
    screen = 2
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = apps.default.music,
    screen = 2
  },
  {
    icon = icons.lab,
    type = 'any',
    defaultApp = apps.default.terminal,
    screen = 2
  }
}

awful.layout.layouts = {
  awful.layout.suit.max,
  awful.layout.suit.tile,
  awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.max,
          gap_single_client = false,
          gap = 4,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
