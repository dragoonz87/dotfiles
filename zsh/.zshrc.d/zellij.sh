function zj() {
    if [[ $# > 0 ]]; then
        zellij $@
        return
    fi

    max=$(zellij ls -s | sort -hr | cut -d "-" -f 2 | head -n 1)
    if [[ -z $max ]] || [[ $max == "No active sessions found" ]]; then
        max=0
    fi

    max=$(($max + 1))
    user=$(whoami)

    zellij -s "${user}-${max}"
}
