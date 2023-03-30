#!/usr/bin/env bash
#
: ${EM_CMD:='em'}

# md: Open named markdown documents with Emacs.
md ()
{
    declare -a args=()
    declare -a files=()

    for arg; do
        if test -f "$arg"; then
            files+=( "$arg" )
        else
            args+=( "$arg" )
        fi
    done

    for f in "${files[@]}"; do
        $EM_CMD "${args[@]}" --markdown "$f"
    done
}
