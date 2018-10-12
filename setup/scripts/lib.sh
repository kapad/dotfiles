function as_root {
    if (($EUID != 0)); then
        if [[ -t 1 ]]; then
            sudo "$@"
        else
            exec 1>output_file
            gksu "$@"
        fi
        exit
    fi
}
