#!/usr/bin/env bash
#
: ${EM_CMD:='em'}

# buf: Open Emacs buffers.
buf ()
{
    declare -a args=()
    declare -a bufs=()

    for arg; do
        if [[ ."$arg" =~ ^\.-.* ]]; then
            args+=( "$arg" )
        else
            bufs+=( "$arg" )
        fi
    done

    if (( ${#bufs[*]} == 0 )); then
        $EM_CMD "${args[@]}"
    else
        for b in "${bufs[@]}"; do
            $EM_CMD "${args[@]}" --buf "$b"
        done
    fi
}
