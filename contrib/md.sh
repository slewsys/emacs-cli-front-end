#!/usr/bin/env bash
#
: ${EM:='em'}

# md: Open named markdown documents with Emacs.
md ()
{
    declare -a args=()
    declare -a files=()

    for arg; do
        if test -f "$arg"; then
            files+=( "$(printf '%q' "$arg")" )
        else
            args+=( "$arg" )
        fi
    done

    for f in "${files[@]}"; do
        eval $EM "${args[@]}" --markdown "$f"
    done

}
