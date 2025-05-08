function zj() {
    if [[ $# > 0 ]]; then
        zellij $@
        return
    fi

    max=$(zellij ls -s | sort -r | cut -d "-" -f 2 | head -n 1)
    if [[ -z $max ]] || [[ $max == "No active sessions found" ]]; then
        max=0
    fi

    echo "we got" $max
    max=$(($max + 1))
    echo $max
    user=$(whoami)

    zellij -s "${user}-${max}"
}
