export __VS_CODE_SETTINGS="${HOME}/Library/Application Support/Code/User/settings.json"
export __SUBLIME_SETTINGS="${HOME}/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"

function __set_vs_code_zooom() {
    jq '."window.zoomLevel" = '${1} ${__VS_CODE_SETTINGS} > ${__VS_CODE_SETTINGS}".tmp"
    mv ${__VS_CODE_SETTINGS}".tmp" ${__VS_CODE_SETTINGS}
}

function __set_sublime_text_zoom() {
    jq '.ui_scale = '${1} ${__SUBLIME_SETTINGS} > ${__SUBLIME_SETTINGS}".tmp"
    mv ${__SUBLIME_SETTINGS}".tmp" ${__SUBLIME_SETTINGS}
}

function dual_display() {
    __set_vs_code_zooom 1.67
    __set_sublime_text_zoom 1.33
}

function mac_display() {
    __set_vs_code_zooom 0.83
    __set_sublime_text_zoom 1.17
}
