#!/bin/bash

# TODO: add music play, next, previous shortcuts. 

gsettings set org.gnome.settings-daemon.plugins.power power-button-action "nothing"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout "3600"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout "900"

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'in+eng')]"

gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled "true"
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "3400"

gsettings set org.gnome.desktop.interface gtk-theme "Ant"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas set org.gnome.shell.extensions.user-theme name "Materia-dark-compact"

gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface clock-show-date "true"
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 12"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"

gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/lockkeys@vaina.lt/schemas set org.gnome.shell.extensions.lockkeys style "both"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/lockkeys@vaina.lt/schemas set org.gnome.shell.extensions.lockkeys notifications "false"

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "LEFT"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "32"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces "true"

gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/donotdisturb-button@nls1729/schemas set org.gnome.shell.extensions.donotdisturb-button override "false"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/donotdisturb-button@nls1729/schemas set org.gnome.shell.extensions.donotdisturb-button panel-icon-center "true"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/donotdisturb-button@nls1729/schemas set org.gnome.shell.extensions.donotdisturb-button panel-count-show "true"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/donotdisturb-button@nls1729/schemas set org.gnome.shell.extensions.donotdisturb-button busy-state "false"
gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/donotdisturb-button@nls1729/schemas set org.gnome.shell.extensions.donotdisturb-button overrride-busy-state "false"

gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/night-light-slider.timur@linux.com/schemas set org.gnome.shell.extensions.nightlightslider show-always "true"

gsettings set org.gnome.gedit.preferences.editor highlight-current-line "true"
gsettings set org.gnome.gedit.preferences.editor display-right-margin "true"
gsettings set org.gnome.gedit.preferences.editor display-overview-map "true"
gsettings set org.gnome.gedit.preferences.editor tabs-size "uint32 4"
gsettings set org.gnome.gedit.preferences.editor display-line-numbers "true"
gsettings set org.gnome.gedit.preferences.editor wrap-mode "word"
gsettings set org.gnome.gedit.preferences.editor insert-spaces "true"
gsettings set org.gnome.gedit.preferences.editor right-margin-position "uint32 120"
gsettings set org.gnome.gedit.preferences.editor background-pattern "none"
gsettings set org.gnome.gedit.preferences.editor wrap-last-split-mode "word"
gsettings set org.gnome.gedit.preferences.editor auto-indent "true"
gsettings set org.gnome.gedit.preferences.ui show-tabs-mode "auto"

gsettings set org.gnome.desktop.privacy remove-old-temp-files "true"
gsettings set org.gnome.desktop.privacy remove-old-trash-files "true"

gsettings set org.gnome.desktop.a11y always-show-universal-access-status "true"

gsettings set org.gnome.shell.app-switcher current-workspace-only "true"

#shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader ""
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ""
gsettings set org.gnome.settings-daemon.plugins.media-keys logout ""
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal ""
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot ""
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot ""
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier ""
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Alt>Print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "shutter -w"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Take a screenshot of a window with shutter"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Shift>Print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "shutter -s"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Take a screenshot of an area with shutter"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "Print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "shutter -f"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Take a screenshot with shutter"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "<Super>t"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "terminator"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "Launch Terminator"

# TODO
# Add for move window one monitor up. 
# Add for move window one monitor down. 
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "@as []"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "['<Shift><Super>v']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "@as []"
gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally "['<Shift><Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"
