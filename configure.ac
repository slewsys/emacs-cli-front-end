#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([em], [0.0.1], [bug-emacs@gnu.org])
AM_INIT_AUTOMAKE()

LOCAL_PREFIX=/usr/local/sbin${PATH_SEPARATOR}/usr/local/bin${PATH_SEPARATOR}

AC_MSG_CHECKING([whether to search optional path])
AC_ARG_WITH([opt-path],
  [AS_HELP_STRING([--with-opt-path@<:@=PATH@:>@],
    [search optional PATH @{:@default: /opt/local/bin@:}@])],
  [], [with_opt_path=check])
if test ."$with_opt_path" = .'yes' || test ."$with_opt_path" = .'check'; then
    if test -d /opt/local/bin; then
        OPT_PREFIX=/opt/local/sbin${PATH_SEPARATOR}/opt/local/bin
    fi
elif test ! ."$with_opt_path" = .'no'; then
    if test -d "$with_opt_path"; then
        OPT_PREFIX=${with_opt_path}
    else
        AC_MSG_WARN([${with_opt_path}: No such file or directory])
    fi
fi
AC_MSG_RESULT([${OPT_PREFIX:-no}])
OPT_PATHS=$(echo "$OPT_PREFIX" | tr "${PATH_SEPARATOR}" ' ')
AC_SUBST([OPT_PATHS], ["$OPT_PATHS"])
OPT_PREFIX=${OPT_PREFIX:+"${OPT_PREFIX}${PATH_SEPARATOR}"}

# Checks for programs.

AC_PATH_PROGS([AWK_CMD],        [gawk awk],           [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([BASENAME_CMD],   [gbasename basename], []  [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([DIRNAME_CMD],    [gdirname dirname],   [], [${OPT_PREFIX}${PATH}])

AC_PATH_PROG([ED_CMD],          [ed],                 [], [${LOCAL_PREFIX}${PATH}])

AC_ARG_VAR([EMACS_CMD], [emacs])
AC_PATH_PROG([EMACS_CMD], [emacs], [],
  [/Applications/MacPorts/Emacs.app/Contents/MacOS$PATH_SEPARATOR${OPT_PREFIX}${PATH}])

# If Emacs.app on case-insensitive filesystem...
if test ."$EMACS_CMD" = ."/Applications/MacPorts/Emacs.app/Contents/MacOS/emacs"; then
  EMACS_CMD='/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs'
  AC_SUBST([EMACS_LISP_DIR],
    [/Applications/MacPorts/Emacs.app/Contents/Resources/lisp])
elif test ."$prefix" = .'NONE'; then
  AC_SUBST([EMACS_LISP_DIR],
    [${ac_default_prefix}/share/emacs/resources/lisp])
else
  AC_SUBST([EMACS_LISP_DIR],
    [${prefix}/share/emacs/resources/lisp])
fi

AC_ARG_VAR([EMACSCLIENT_CMD], [emacsclient])
AC_PATH_PROG([EMACSCLIENT_CMD], [emacsclient], [],
  [/Applications/MacPorts/Emacs.app/Contents/MacOS/bin$PATH_SEPARATOR${OPT_PREFIX}${PATH}])


AC_PATH_PROGS([FIND_CMD],       [gfind find],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([FMT_CMD],        [gfmt fmt],           [], [${OPT_PREFIX}${PATH}])

AC_PATH_PROG([GETCONF_CMD],     [getconf])

AC_PATH_PROGS([GREP_CMD],       [ggrep grep],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([HEAD_CMD],       [ghead head],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([ID_CMD],         [gid id],             [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([KILL_CMD],       [gkill kill],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([MKDIR_CMD],      [gmkdir mkdir],       [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([MKTEMP_CMD],     [gmktemp mktemp],     [], [${OPT_PREFIX}${PATH}])

AC_PATH_PROG([OSASCRIPT_CMD],   [osascript])
AC_PATH_PROG([PKILL_CMD],       [pkill])
AC_PATH_PROG([PS_CMD],          [ps])

AC_PATH_PROGS([READLINK_CMD],   [greadlink readlink], [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([RM_CMD],         [grm rm],             [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([SED_CMD],        [gsed sed],           [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([SLEEP_CMD],      [gsleep sleep],       [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([SORT_CMD],       [gsort sort],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([STAT_CMD],       [gstat stat],         [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([TOUCH_CMD],      [gtouch touch],       [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([TTY_CMD],        [gtty tty],           [], [${OPT_PREFIX}${PATH}])
AC_PATH_PROGS([UNAME_CMD],      [guname uname],       [], [${OPT_PREFIX}${PATH}])

AC_PATH_PROG([WMCTRL_CMD],      [wmctrl])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([em], [chmod +x em])
AC_CONFIG_FILES([contrib/emc], [chmod +x contrib/emc])
AC_CONFIG_FILES([contrib/emf], [chmod +x contrib/emf])
AC_CONFIG_FILES([contrib/set-tmpdir], [chmod +x contrib/set-tmpdir])

AC_OUTPUT
