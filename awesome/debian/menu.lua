-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Applications_Accessibility"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Data_Management"] = {
	{"Tomboy","/usr/bin/tomboy"},
}
Debian_menu["Debian_Applications_Editors"] = {
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Applications_File_Management"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"GNOME Search Tool","/usr/bin/gnome-search-tool","/usr/share/pixmaps/gsearchtool.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Applications_Graphics"] = {
	{"GNOME Screenshot Tool","/usr/bin/gnome-panel-screenshot"},
	{"OpenOffice.org Draw","/usr/bin/oodraw","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"XSane","/usr/bin/xsane","/usr/share/pixmaps/xsane.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Network_Communication"] = {
	{"emesene","emesene","/usr/share/pixmaps/emesene.xpm"},
	{"Evolution","/usr/bin/evolution","/usr/share/pixmaps/evolution.xpm"},
	{"pcmanx-gtk2","/usr/bin/pcmanx","/usr/share/pixmaps/pcmanx.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Terminal Server Client","/usr/bin/tsclient -f","/usr/share/pixmaps/tsclient.xpm"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Network_File_Transfer"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Network_Web_Browsing"] = {
	{"Firefox Browser","/usr/bin/firefox","/usr/share/pixmaps/firefox.png"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Applications_Network"] = {
	{ "Communication", Debian_menu["Debian_Applications_Network_Communication"] },
	{ "File Transfer", Debian_menu["Debian_Applications_Network_File_Transfer"] },
	{ "Web Browsing", Debian_menu["Debian_Applications_Network_Web_Browsing"] },
}
Debian_menu["Debian_Applications_Office"] = {
	{"HPLIP Fax address book","/usr/bin/hp-fab","/usr/share/pixmaps/HPmenu.xpm"},
	{"HPLIP Fax utility","/usr/bin/hp-sendfax","/usr/share/pixmaps/HPmenu.xpm"},
	{"OpenOffice.org Calc","/usr/bin/oocalc","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-calc.xpm"},
	{"OpenOffice.org Impress","/usr/bin/ooimpress","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-impress.xpm"},
	{"OpenOffice.org Writer","/usr/bin/oowriter","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-writer.xpm"},
}
Debian_menu["Debian_Applications_Programming"] = {
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Python (v2.6)", "x-terminal-emulator -e ".."/usr/bin/python2.6","/usr/share/pixmaps/python2.6.xpm"},
	{"Sun Java 6 Web Start","/usr/lib/jvm/java-6-sun-1.6.0.22/bin/javaws -viewer","/usr/share/pixmaps/sun-java6.xpm"},
	{"Tclsh8.4", "x-terminal-emulator -e ".."/usr/bin/tclsh8.4"},
	{"TkWish8.4","x-terminal-emulator -e /usr/bin/wish8.4"},
}
Debian_menu["Debian_Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"OpenOffice.org Math","/usr/bin/oomath","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Science"] = {
	{ "Mathematics", Debian_menu["Debian_Applications_Science_Mathematics"] },
}
Debian_menu["Debian_Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Applications_Sound"] = {
	{"Audacious","/usr/bin/audacious2"},
	{"gmix (Gnome 2.0 Mixer)","/usr/bin/gnome-volume-control","/usr/share/pixmaps/gnome-mixer.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_Applications_System_Administration"] = {
	{"Aptitude", "x-terminal-emulator -e ".."/usr/bin/aptitude"},
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center","/usr/share/pixmaps/control-center2.xpm"},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"HPLIP File printing","/usr/bin/hp-print","/usr/share/pixmaps/HPmenu.xpm"},
	{"OpenJDK Java 6 Console","/usr/lib/jvm/java-6-openjdk/bin/jconsole","/usr/share/pixmaps/openjdk-6.xpm"},
	{"OpenJDK Java 6 Policy Tool","/usr/lib/jvm/java-6-openjdk/bin/policytool","/usr/share/pixmaps/openjdk-6.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Shares Admin","/usr/bin/shares-admin","/usr/share/gnome-system-tools/pixmaps/shares.xpm"},
	{"Sun Java 6 Plugin Control Panel","/usr/lib/jvm/java-6-sun-1.6.0.22/bin/ControlPanel","/usr/share/pixmaps/sun-java6.xpm"},
	{"Time Admin","/usr/bin/time-admin","/usr/share/gnome-system-tools/pixmaps/time.xpm"},
	{"User accounts Admin","/usr/bin/users-admin","/usr/share/gnome-system-tools/pixmaps/users.xpm"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_System_Hardware"] = {
	{"GNOME Floppy Formatter","/usr/bin/gfloppy","/usr/share/pixmaps/gfloppy.xpm"},
	{"HPLIP Toolbox","/usr/bin/hp-toolbox","/usr/share/pixmaps/HPmenu.xpm"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_System_Language_Environment"] = {
	{"gcin","/usr/bin/gcin","/usr/share/pixmaps/gcin.xpm"},
	{"gcin-setup","/usr/bin/gcin-setup","/usr/share/pixmaps/gcin.xpm"},
}
Debian_menu["Debian_Applications_System_Monitoring"] = {
	{"GNOME Log Viewer","/usr/bin/gnome-system-log","/usr/share/pixmaps/gnome-system-log.xpm"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Sun Java 6 VisualVM","/usr/lib/jvm/java-6-sun-1.6.0.22/bin/jvisualvm","/usr/share/pixmaps/sun-java6.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_System_Package_Management"] = {
	{"Synaptic Package Manager","/usr/bin/gksu /usr/sbin/synaptic","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Applications_System_Security"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
	{"Sun Java 6 Policy Tool","/usr/lib/jvm/java-6-sun-1.6.0.22/bin/policytool","/usr/share/pixmaps/sun-java6.xpm"},
}
Debian_menu["Debian_Applications_System"] = {
	{ "Administration", Debian_menu["Debian_Applications_System_Administration"] },
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{ "Hardware", Debian_menu["Debian_Applications_System_Hardware"] },
	{ "Language Environment", Debian_menu["Debian_Applications_System_Language_Environment"] },
	{ "Monitoring", Debian_menu["Debian_Applications_System_Monitoring"] },
	{ "Package Management", Debian_menu["Debian_Applications_System_Package_Management"] },
	{ "Security", Debian_menu["Debian_Applications_System_Security"] },
}
Debian_menu["Debian_Applications_Terminal_Emulators"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"ROXTerm","/usr/bin/roxterm","/usr/share/pixmaps/roxterm.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Applications_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"GNOME Dictionary","/usr/bin/gnome-dictionary","/usr/share/pixmaps/gdict.xpm"},
}
Debian_menu["Debian_Applications_Video"] = {
	{"totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
}
Debian_menu["Debian_Applications_Viewers"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"F-Spot","/usr/bin/f-spot"},
	{"Xditview","xditview"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibility", Debian_menu["Debian_Applications_Accessibility"] },
	{ "Data Management", Debian_menu["Debian_Applications_Data_Management"] },
	{ "Editors", Debian_menu["Debian_Applications_Editors"] },
	{ "File Management", Debian_menu["Debian_Applications_File_Management"] },
	{ "Graphics", Debian_menu["Debian_Applications_Graphics"] },
	{ "Network", Debian_menu["Debian_Applications_Network"] },
	{ "Office", Debian_menu["Debian_Applications_Office"] },
	{ "Programming", Debian_menu["Debian_Applications_Programming"] },
	{ "Science", Debian_menu["Debian_Applications_Science"] },
	{ "Shells", Debian_menu["Debian_Applications_Shells"] },
	{ "Sound", Debian_menu["Debian_Applications_Sound"] },
	{ "System", Debian_menu["Debian_Applications_System"] },
	{ "Terminal Emulators", Debian_menu["Debian_Applications_Terminal_Emulators"] },
	{ "Text", Debian_menu["Debian_Applications_Text"] },
	{ "Video", Debian_menu["Debian_Applications_Video"] },
	{ "Viewers", Debian_menu["Debian_Applications_Viewers"] },
}
Debian_menu["Debian_Games_Action"] = {
	{"Gnibbles","/usr/games/gnibbles","/usr/share/pixmaps/gnibbles.xpm"},
}
Debian_menu["Debian_Games_Board"] = {
	{"Four-in-a-row","/usr/games/gnect","/usr/share/pixmaps/gnect.xpm"},
	{"GL Chess","/usr/games/glchess","/usr/share/pixmaps/glchess.xpm"},
	{"Gnome GYahtzee","/usr/games/gtali","/usr/share/pixmaps/gtali.xpm"},
	{"Gnome Iagno","/usr/games/iagno","/usr/share/pixmaps/iagno.xpm"},
	{"Gnome Lines","/usr/games/glines","/usr/share/pixmaps/glines.xpm"},
	{"Gnome Mahjongg","/usr/games/mahjongg","/usr/share/pixmaps/mahjongg.xpm"},
}
Debian_menu["Debian_Games_Card"] = {
	{"Gnome Blackjack","/usr/games/blackjack","/usr/share/pixmaps/blackjack.xpm"},
	{"Gnome FreeCell","/usr/games/sol --variation freecell",},
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_Games_Puzzles"] = {
	{"Gnome Robots","/usr/games/gnobots2","/usr/share/pixmaps/gnobots2.xpm"},
	{"Gnome Sudoku","/usr/games/gnome-sudoku","/usr/share/pixmaps/gnome-sudoku.xpm"},
	{"Gnome Tetravex","/usr/games/gnotravex","/usr/share/pixmaps/gnotravex.xpm"},
	{"Gnomine","/usr/games/gnomine","/usr/share/pixmaps/gnomine.xpm"},
	{"Same Gnome","/usr/games/same-gnome","/usr/share/pixmaps/same-gnome.xpm"},
}
Debian_menu["Debian_Games_Toys"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Games"] = {
	{ "Action", Debian_menu["Debian_Games_Action"] },
	{ "Board", Debian_menu["Debian_Games_Board"] },
	{ "Card", Debian_menu["Debian_Games_Card"] },
	{ "Puzzles", Debian_menu["Debian_Games_Puzzles"] },
	{ "Toys", Debian_menu["Debian_Games_Toys"] },
}
Debian_menu["Debian_Help"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian"] = {
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Games", Debian_menu["Debian_Games"] },
	{ "Help", Debian_menu["Debian_Help"] },
}
