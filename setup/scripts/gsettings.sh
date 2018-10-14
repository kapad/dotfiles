#!/bin/bash

gsettings set org.gnome.settings-daemon.plugins.power power-button-action "nothing"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout "3600"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout "900"

# gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'in+eng')]"
# gsettings set org.gnome.desktop.input-sources mru-sources "[('xkb', 'us'), ('xkb', 'in+eng')]"

gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled "true"

gsettings set org.gnome.desktop.interface gtk-theme "Ant"
gsettings set org.gnome.desktop.interface cursor-theme "Pop"
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings set org.gnome.shell.extensions.user-theme name "Materia-dark-compact"

gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface clock-show-date "true"
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 12"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"

gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

gsettings set org.gnome.shell.extensions.lockkeys style "both"
gsettings set org.gnome.shell.extensions.lockkeys notifications "false"

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position="LEFT"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "32"

# gsettings set org.gnome.shell.extensions.caffeine user-enabled "true"

gsettings set org.gnome.shell.extensions.donotdisturb-button override "false"
gsettings set org.gnome.shell.extensions.donotdisturb-button panel-icon-center "true"
gsettings set org.gnome.shell.extensions.donotdisturb-button panel-count-show "true"
gsettings set org.gnome.shell.extensions.donotdisturb-button busy-state "false"
gsettings set org.gnome.shell.extensions.donotdisturb-button overrride-busy-state "false"

gsettings set org.gnome.shell.extensions.nightlightslider show-always "true"

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

