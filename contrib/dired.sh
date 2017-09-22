#!/usr/bin/env bash
#
: ${EM:='em'}

# dired: Open directories with Emacs.
dired ()
{
    declare -a args=()
    declare -a dirs=()

    for arg; do
        if test -d "$arg"; then
            dirs+=( "$(printf '%q' "$arg")" )
        else
            args+=( "$arg" )
        fi
    done

    if (( ${#dirs[@]} == 0 )); then
        dirs=( '.' )
    fi

    for d in "${dirs[@]}"; do
        eval $EM "${args[@]}" --dired "$d"
    done
}
