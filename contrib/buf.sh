#!/usr/bin/env bash
#
: ${EM:='em'}

# buf: Open Emacs buffers.
buf ()
{
    declare -a args=()
    declare -a bufs=()

    for arg; do
        if [[ "$arg" =~ ^-.* ]]; then
            args+=( "$arg" )
        else
            bufs+=( $(printf '%q' "$arg") )
        fi
    done

    if (( ${#bufs[*]} == 0 )); then
        $EM "${args[@]}"
    else
        for b in "${bufs[@]}"; do
            $EM "${args[@]}" --buf $b
        done
    fi
}
