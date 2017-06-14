#!/usr/bin/env bash
#
: ${EM:='em'}

# emerge: Open files with Emacs function `emerge-fles'.
emerge ()
{
    declare -a args=()
    declare -a file=()
    declare usage="Usage: emerge FILE1 FILE2 [OUTPUT-FILE]"

    for arg; do
        if test -f "$arg"; then
            file+=( $(printf '%q' "$arg") )
        else
            args+=( "$arg" )
        fi
    done

    case ${#file[*]} in
        0|1)
            echo "$usage"
            return 1
            ;;
        2)
            $EM "${args[@]}" --two-way-merge=${file[0]},${file[1]}
            ;;
        3)
            $EM "${args[@]}" --two-way-merge=${file[0]},${file[1]},${file[2]}
            ;;
        *)
            echo "$usage"
            return 1
            ;;
    esac
}
