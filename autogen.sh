#!/usr/bin/env bash
#
# @(#)autogen.sh
#
# This script generates a GNU Autoconf configure script.
#
#
# OS-agnstoic readlink for existent files/directories.
resolve-existing ()
{
    if readlink --version 2>&1 | grep -q 'coreutils'; then
        readlink -e "$@"
    else
        readlink -f N "$@"
    fi
}

check-prerequisites ()
{
    local cmd=''

    for cmd in aclocal automake autoreconf bash; do
        if ! cmd_path=$(command -v "$cmd" 2>/dev/null); then
            cat >&2 <<EOF
${script_name}: ${cmd}: Command not found
Before running this script, please verify that \$PATH includes
GNU Autoconf, Automake, and Libtool commands.
EOF
            return 1
        fi
    done

    local -i major_ver=$(
        bash --version |
            sed -n -e '/^.*bash, version \(.\).*/s//\1/p'
          )

    if (( major_ver < 5 )); then
        cat >&2 <<EOF
${script_name}: bash: Version too old
Before running this script, please verify that \$PATH includes a
current version of GNU Bash which occurs before others.
EOF
    fi
}

run-command ()
{
    local cmd=$1

    $verbose && cat <<EOF
${script_name}: Running:
    pushd "$script_dir" && $cmd
EOF

    local -i exit_status=0
    local cmd_output=''

    if ! cmd_output=$(pushd "$script_dir" && $cmd 2>&1); then
        cat <<EOF
$script_name:
$cmd_output
EOF
        return 1
    fi
}

if test ."$0" = ."${BASH_SOURCE[0]}"; then
    declare script=$(resolve-existing "$0")
    declare script_name=${script##*/}
    declare script_dir=${script%/*}

    declare -a command_list=(
        'aclocal --warnings=gnu'
        'automake --verbose --add-missing'
        'autoreconf --verbose --install'
    )

    verbose='true'
    case "$1" in
        -h*|--h*)
            echo "Usage: $script_name [-h|--help] [-s|--silent]"
            exit
            ;;
        -s*|--s*)
            verbose='false'
            shift
            ;;
    esac

    check-prerequisites || exit $?
    for cmd in "${command_list[@]}"; do
        run-command "$cmd" || exit $?
    done

    $verbose && cat >&2 <<EOF
$script_name:
========================================================================

     Automake and autoreconf appear to have completed successfully.
     To continue, optionally create and cd to a build directory, then
     run:

             \$ \$top_srcdir/configure
             \$ make
             \$ sudo make install

------------------------------------------------------------------------
EOF
fi
