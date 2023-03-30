#!/usr/bin/env bash
#
: ${EM_CMD:='em'}

# emerge: Open files with Emacs function `emerge-fles'.
emerge ()
{
    declare -a args=()
    declare -a file=()
    declare usage="Usage: emerge FILE1 FILE2 [OUTPUT-FILE]"

    for arg; do
        if test -f "$arg"; then
            file+=( "$arg" )
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
            $EM_CMD "${args[@]}" \
                 --two-way-merge="${file[0]}","${file[1]}"
            ;;
        3)
            $EM_CMD "${args[@]}" \
                 --two-way-merge="${file[0]}","${file[1]}","${file[2]}"
            ;;
        *)
            echo "$usage"
            return 1
            ;;
    esac
}
