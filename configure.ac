#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([em], [0.0.1], [bug-emacs@gnu.org])
AM_INIT_AUTOMAKE()

# Checks for programs.

AC_PATH_PROGS([AWK_CMD], [gawk awk])

AC_PATH_PROG([BASENAME_CMD], [basename])
AC_PATH_PROG([DIRNAME_CMD], [dirname])
AC_PATH_PROG([ED_CMD], [ed])
AC_PATH_PROG([EGREP_CMD], [egrep])

AC_ARG_VAR([EMACS_CMD], [emacs])
AC_PATH_PROG([EMACS_CMD], [emacs], [],
  [/Applications/Emacs.app/Contents/MacOS$PATH_SEPARATOR$PATH])

# If Emacs.app on case-insensitive filesystem...
if test ."$EMACS_CMD" = ."/Applications/Emacs.app/Contents/MacOS/emacs"; then
  EMACS_CMD='/Applications/Emacs.app/Contents/MacOS/Emacs'
  AC_SUBST([EMACS_LISP_DIR],
    [/Applications/Emacs.app/Contents/Resources/lisp])
elif test ."$prefix" = .'NONE'; then
  AC_SUBST([EMACS_LISP_DIR],
    [${ac_default_prefix}/share/emacs/resources/lisp])
else
  AC_SUBST([EMACS_LISP_DIR],
    [${prefix}/share/emacs/resources/lisp])
fi

AC_ARG_VAR([EMACSCLIENT_CMD], [emacsclient])
AC_PATH_PROG([EMACSCLIENT_CMD], [emacsclient], [],
  [/Applications/Emacs.app/Contents/MacOS/bin$PATH_SEPARATOR$PATH])

AC_PATH_PROG([FIND_CMD], [find])
AC_PATH_PROG([GETCONF_CMD], [getconf])
AC_PATH_PROG([HEAD_CMD], [head])
AC_PATH_PROG([ID_CMD], [id])
AC_PATH_PROG([KILL_CMD], [kill])
AC_PATH_PROG([MKDIR_CMD], [mkdir])
AC_PATH_PROG([MKTEMP_CMD], [mktemp])
AC_PATH_PROG([OSASCRIPT_CMD], [osascript])
AC_PATH_PROG([PKILL_CMD], [pkill])
AC_PATH_PROG([PS_CMD], [ps])
AC_PATH_PROG([READLINK_CMD], [readlink])
AC_PATH_PROG([RM_CMD], [rm])
AC_PATH_PROGS([SCRIPT_CMD], [script])
AC_PATH_PROGS([SLEEP_CMD], [gsleep sleep])
AC_PATH_PROG([SORT_CMD], [sort])
AC_PATH_PROG([STAT_CMD], [stat])
AC_PATH_PROG([TOUCH_CMD], [touch])
AC_PATH_PROG([TTY_CMD], [tty])
AC_PATH_PROG([UNAME_CMD], [uname])
AC_PATH_PROG([WMCTRL_CMD], [wmctrl])

AC_CONFIG_FILES([Makefile
 em
 contrib/emc
 contrib/emf
 contrib/set-tmpdir.sh
 ])
AC_OUTPUT
