#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([em], [0.0.1], [bug-emacs@gnu.org])
AM_INIT_AUTOMAKE()

# Checks for programs.

AC_PATH_PROGS([AWK_CMD], [gawk awk])
AC_PATH_PROGS([BASENAME_CMD], [gbasename basename])
AC_PATH_PROGS([DIRNAME_CMD], [gdirname dirname])

AC_PATH_PROG([ED_CMD], [ed])

AC_PATH_PROG([GREP_CMD], [ggrep grep])

AC_ARG_VAR([EMACS_CMD], [emacs])
AC_PATH_PROG([EMACS_CMD], [emacs], [],
  [/Applications/MacPorts/Emacs.app/Contents/MacOS$PATH_SEPARATOR$PATH])

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
  [/Applications/MacPorts/Emacs.app/Contents/MacOS/bin$PATH_SEPARATOR$PATH])


AC_PATH_PROGS([FIND_CMD], [gfind find])
AC_PATH_PROGS([HEAD_CMD], [ghead head])
AC_PATH_PROGS([ID_CMD], [gid id])
AC_PATH_PROGS([KILL_CMD], [gkill kill])
AC_PATH_PROGS([MKDIR_CMD], [gmkdir mkdir])
AC_PATH_PROGS([MKTEMP_CMD], [gmktemp mktemp])

AC_PATH_PROG([OSASCRIPT_CMD], [osascript])
AC_PATH_PROG([PKILL_CMD], [pkill])
AC_PATH_PROG([PS_CMD], [ps])

AC_PATH_PROGS([READLINK_CMD], [greadlink readlink])
AC_PATH_PROGS([RM_CMD], [grm rm])
AC_PATH_PROGS([SLEEP_CMD], [gsleep sleep])
AC_PATH_PROGS([SORT_CMD], [gsort sort])
AC_PATH_PROGS([STAT_CMD], [gstat stat])
AC_PATH_PROGS([TOUCH_CMD], [gtouch touch])
AC_PATH_PROGS([TTY_CMD], [gtty tty])
AC_PATH_PROGS([UNAME_CMD], [guname uname])

AC_PATH_PROG([WMCTRL_CMD], [wmctrl])

AC_CONFIG_FILES([Makefile
 em
 contrib/emc
 contrib/emf
 contrib/set-tmpdir.sh
 ])
AC_OUTPUT
