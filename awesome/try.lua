-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("vicious")

-- Load Debian menu entries
require("debian.menu")
require("teardrop")
require("scratchpad")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
beautiful.init(awful.util.getdir("config") .. "/zenburn.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

gvim="gvim"
file_manager="nautilus"
p4v="/home/htc/libs/p4/bin/p4v"
eclipse="/home/htc/eclipse/eclipse"
opera="opera"
office="openoffice.org"
pcman="pcmanx"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  awful.layout.suit.tile,        -- 1
  awful.layout.suit.tile.bottom, -- 2
  awful.layout.suit.fair,        -- 3
  awful.layout.suit.max,         -- 4
  awful.layout.suit.magnifier,   -- 5
  awful.layout.suit.floating     -- 6
}
-- }}}


-- {{{ Tags
tags = {
  names  = { "term", "vim", "web", "office", "im", "eclipse", "fm", "media", 9  },
  layout = { layouts[2], layouts[1], layouts[4], layouts[4], layouts[1],
             layouts[5], layouts[5], layouts[4], layouts[6] 
}}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
    awful.tag.setproperty(tags[s][5], "mwfact", 0.13)
    --awful.tag.setproperty(tags[s][6], "hide",   true)
    awful.tag.setproperty(tags[s][9], "hide",   true)
end
-- }}}



-- {{{ Wibox
--
-- {{{ Widgets configuration
--
-- {{{ Reusable separators
spacer    = widget({ type = "textbox"  })
separator = widget({ type = "imagebox" })
spacer.text     = " "
separator.image = image(beautiful.widget_sep)
-- }}}

-- {{{ CPU usage and temperature
cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)
-- Initialize widgets
cpugraph  = awful.widget.graph()
tzswidget = widget({ type = "textbox" })
-- Graph properties
cpugraph:set_width(40)
cpugraph:set_height(14)
cpugraph:set_background_color(beautiful.fg_off_widget)
cpugraph:set_color(beautiful.fg_end_widget)
cpugraph:set_gradient_angle(0)
cpugraph:set_gradient_colors({ beautiful.fg_end_widget,
   beautiful.fg_center_widget, beautiful.fg_widget
}) -- Register widgets
vicious.register(cpugraph,  vicious.widgets.cpu,     "$1")
vicious.register(tzswidget, vicious.widgets.thermal, "$1C", 19, "thermal_zone0")
-- }}}

-- {{{ Battery state
baticon = widget({ type = "imagebox" })
baticon.image = image(beautiful.widget_bat)
-- Initialize widget
batwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(batwidget, vicious.widgets.bat, "$1$2%", 61, "BAT0")
-- }}}

-- {{{ Memory usage
memicon = widget({ type = "imagebox" })
memicon.image = image(beautiful.widget_mem)
-- Initialize widget
membar = awful.widget.progressbar()
-- Pogressbar properties
membar:set_width(10)
membar:set_height(12)
membar:set_vertical(true)
membar:set_background_color(beautiful.fg_off_widget)
membar:set_border_color(beautiful.border_widget)
membar:set_color(beautiful.fg_widget)
membar:set_gradient_colors({ beautiful.fg_widget,
   beautiful.fg_center_widget, beautiful.fg_end_widget
}) -- Register widget
vicious.register(membar, vicious.widgets.mem, "$1", 13)
-- }}}


-- {{{ Network usage
dnicon = widget({ type = "imagebox" })
upicon = widget({ type = "imagebox" })
dnicon.image = image(beautiful.widget_net)
upicon.image = image(beautiful.widget_netup)
-- Initialize widget
netwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(netwidget, vicious.widgets.net, '<span color="'
  .. beautiful.fg_netdn_widget ..'">${eth0 down_kb}</span> <span color="'
  .. beautiful.fg_netup_widget ..'">${eth0 up_kb}</span>', 3)
-- }}}


-- {{{ Volume level
volicon = widget({ type = "imagebox" })
volicon.image = image(beautiful.widget_vol)
-- Initialize widgets
volbar    = awful.widget.progressbar()
volwidget = widget({ type = "textbox" })
-- Progressbar properties
volbar:set_width(10)
volbar:set_height(12)
volbar:set_vertical(true)
volbar:set_background_color(beautiful.fg_off_widget)
volbar:set_border_color(beautiful.border_widget)
volbar:set_color(beautiful.fg_widget)
volbar:set_gradient_colors({ beautiful.fg_widget,
   beautiful.fg_center_widget, beautiful.fg_end_widget
}) -- Enable caching
vicious.enable_caching(vicious.widgets.volume)
-- Register widgets
vicious.register(volbar,    vicious.widgets.volume, "$1",  2, "PCM")
vicious.register(volwidget, vicious.widgets.volume, "$1%", 2, "PCM")
-- Register buttons
volbar.widget:buttons(awful.util.table.join(
   awful.button({ }, 1, function () exec("kmix") end),
   awful.button({ }, 2, function () exec("amixer -q sset Master toggle")   end),
   awful.button({ }, 4, function () exec("amixer -q sset PCM 2dB+", false) end),
   awful.button({ }, 5, function () exec("amixer -q sset PCM 2dB-", false) end)
)) -- Register assigned buttons
volwidget:buttons(volbar.widget:buttons())
-- }}}

-- {{{ Date and time
dateicon = widget({ type = "imagebox" })
dateicon.image = image(beautiful.widget_date)
-- Initialize widget
datewidget = widget({ type = "textbox" })
-- Register widget
vicious.register(datewidget, vicious.widgets.date, "%R", 61)
-- Register buttons
datewidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () exec("pylendar.py") end)
))
-- }}}

-- {{{ System tray
systray = widget({ type = "systray" })
-- }}}
-- }}}

-- {{{ Wibox initialisation
wibox     = {}
promptbox = {}
layoutbox = {}
taglist   = {}
taglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev
))

 for s = 1, screen.count() do
     -- Create a promptbox
     promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
     -- Create a layoutbox
     layoutbox[s] = awful.widget.layoutbox(s)
     layoutbox[s]:buttons(awful.util.table.join(
         awful.button({ }, 1, function () awful.layout.inc(layouts, 1)  end),
         awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
         awful.button({ }, 4, function () awful.layout.inc(layouts, 1)  end),
         awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
     ))
 
     -- Create the taglist
     taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)
     -- Create the wibox
     wibox[s] = awful.wibox({      screen = s,
         fg = beautiful.fg_normal, height = 12,
         bg = beautiful.bg_normal, position = "top",
         border_color = beautiful.border_focus,
         border_width = beautiful.border_width
     })
     -- Add widgets to the wibox
     wibox[s].widgets = {
         {   taglist[s], layoutbox[s], separator, promptbox[s],
             ["layout"] = awful.widget.layout.horizontal.leftright
         },
         s == screen.count() and systray or nil,
         separator, datewidget, dateicon,
         separator, volwidget, spacer, volbar.widget, volicon,
         separator, orgwidget, orgicon,
         separator, mailwidget, mailicon,
         separator, upicon, netwidget, dnicon,
         -- separator, fs.b.widget, fs.s.widget, fs.h.widget, fs.r.widget, fsicon,
         separator, membar.widget, memicon,
         separator, batwidget, baticon,
         separator, tzswidget, spacer, cpugraph.widget, cpuicon,
         separator, ["layout"] = awful.widget.layout.horizontal.rightleft
     }
 end
 -- }}}
 -- }}}


-- {{{ Menu
-- Create a laucher widget and a main menu
-- myawesomemenu = {
--    { "manual", terminal .. " -e man awesome" },
--    { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
--    { "restart", awesome.restart },
--    { "quit", awesome.quit }
-- }
-- 
-- mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                     { "Debian", debian.menu.Debian_menu.Debian },
--                                     { "open terminal", terminal }
--                                   }
--                         })
-- 
-- mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
--                                      menu = mymainmenu })
-- }}}

-- -- {{{ Wibox
-- -- Create a textclock widget
-- mytextclock = awful.widget.textclock({ align = "right" })
-- 
-- -- Create a systray
-- mysystray = widget({ type = "systray" })
-- 
-- -- Create a wibox for each screen and add it
-- mywibox = {}
-- mypromptbox = {}
-- mylayoutbox = {}
-- mytaglist = {}
-- mytaglist.buttons = awful.util.table.join(
--                     awful.button({ }, 1, awful.tag.viewonly),
--                     awful.button({ modkey }, 1, awful.client.movetotag),
--                     awful.button({ }, 3, awful.tag.viewtoggle),
--                     awful.button({ modkey }, 3, awful.client.toggletag),
--                     awful.button({ }, 4, awful.tag.viewnext),
--                     awful.button({ }, 5, awful.tag.viewprev)
--                     )
-- mytasklist = {}
-- mytasklist.buttons = awful.util.table.join(
--                      awful.button({ }, 1, function (c)
--                                               if not c:isvisible() then
--                                                   awful.tag.viewonly(c:tags()[1])
--                                               end
--                                               client.focus = c
--                                               c:raise()
--                                           end),
--                      awful.button({ }, 3, function ()
--                                               if instance then
--                                                   instance:hide()
--                                                   instance = nil
--                                               else
--                                                   instance = awful.menu.clients({ width=250 })
--                                               end
--                                           end),
--                      awful.button({ }, 4, function ()
--                                               awful.client.focus.byidx(1)
--                                               if client.focus then client.focus:raise() end
--                                           end),
--                      awful.button({ }, 5, function ()
--                                               awful.client.focus.byidx(-1)
--                                               if client.focus then client.focus:raise() end
--                                           end))
-- 
-- for s = 1, screen.count() do
--     -- Create a promptbox for each screen
--     mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
--     -- Create an imagebox widget which will contains an icon indicating which layout we're using.
--     -- We need one layoutbox per screen.
--     mylayoutbox[s] = awful.widget.layoutbox(s)
--     mylayoutbox[s]:buttons(awful.util.table.join(
--                            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
--                            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
--                            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
--                            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
--     -- Create a taglist widget
--     mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
-- 
--     -- Create a tasklist widget
--     mytasklist[s] = awful.widget.tasklist(function(c)
--                                               return awful.widget.tasklist.label.currenttags(c, s)
--                                           end, mytasklist.buttons)
-- 
--     -- Create the wibox
--     mywibox[s] = awful.wibox({ position = "bottom", screen = s })
--     -- Add widgets to the wibox - order matters
--     mywibox[s].widgets = {
--         {
--             mylauncher,
--             mytaglist[s],
--             mypromptbox[s],
--             layout = awful.widget.layout.horizontal.leftright
--         },
--         mylayoutbox[s],
--         mytextclock,
--         s == 1 and mysystray or nil,
--         mytasklist[s],
--         layout = awful.widget.layout.horizontal.rightleft
--     }
-- end
-- -- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "a",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "s",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show(true)        end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    
    -- shortkey
    awful.key({ modkey },            "g",    function () awful.util.spawn(gvim) end),
    awful.key({ modkey },            "p",    function () awful.util.spawn(p4v) end),
    awful.key({ modkey },            "e",    function () awful.util.spawn(eclipse) end),
    awful.key({ modkey },            "z",    function () awful.util.spawn(opera) end),
    awful.key({ modkey },            "c",    function () awful.util.spawn(office) end),
    awful.key({ modkey },            "v",    function () awful.util.spawn(pcman) end),
    awful.key({ modkey },            "d",    function () awful.util.spawn(file_manager) end),


    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)

)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     toggle = false,
                     focus = true,
                     switchtotag = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class ="Opera"},
    properties = { floating = true, tag = tags[1][3], }},
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "emesene" },
      properties = { floating = false, tag = tags[1][5], }},
    { rule = { class = "Skype" },
      properties = { floating = false, tag = tags[1][5], }},
    { rule = { class = "ROXterm" },
      properties = { floating = false, tag = tags[1][1], }},
    { rule = { class = "Roxterm" },
      properties = { floating = false, tag = tags[1][1], }},
    { rule = { class = "roxterm" },
      properties = { floating = false, tag = tags[1][1], }},
    { rule = { class = ".*term.*" },
      properties = { floating = false, tag = tags[1][1], }},
    { rule = { name = ".*term.*" },
      properties = { floating = false, tag = tags[1][1], }},
    { rule = { class = "Eclipse" },
      properties = { floating = true, tag = tags[1][6], }},
    { rule = { class = "nautilus" },
      properties = { floating = false, tag = tags[1][7], }},
    { rule = { name = ".*檔案瀏覽器.*" },
      properties = { floating = false, tag = tags[1][7], }},
    { rule = { name = ".*google.*瀏覽器.*" },
      properties = { floating = false, tag = tags[1][3], }},
    { rule = { name = ".*PCMan.*" },
      properties = { floating = false, tag = tags[1][9], }},
    { rule = { name = ".*PCMan.*" },
      properties = { floating = false, tag = tags[1][9], }},
    { rule = { name = ".*OpenOffice.*" },
      properties = { floating = true, tag = tags[1][4], }},
    { rule = { name = ".*Adobe Reader.*" },
      properties = { floating = true, tag = tags[1][4], }},
    { rule = { class = "GVIM",    instance = "gvim" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "GVIM",    instance = "_Remember_" },
      properties = { floating = true }, callback = awful.titlebar.add  },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--- function run_once(prg)
---     result = awful.util.spawn("pgrep -u $USER -x " .. prg)
---     awful.util.spawn("cat " .. result .. " >> ~htc/testfile")
--- end
--- os.execute("betaradio&")
--- os.execute("parcellite&")
--- os.execute("skype&")
--- os.execute("emesene&")
--- run_once("betaradio")
-- function run_once(prg)
--     os.execute("pgrep -u $USER -x " .. prg .. " || " .. prg .. "&")
-- end
-- run_once("parcellite")
-- run_once("emesene")
-- run_once("skype")
-- run_once("betaradio")

function run_once(prg)
    if not prg then
        do return nil end
    end
    awful.util.spawn_with_shell("pgrep -f -u $USER -x " .. prg .. " || (" .. prg .. ")")
end

--run_once("parcellite")
--run_once("emesene")
--run_once("skype")
--run_once("betaradio")
-- loadsafe("mod-statusbar")
