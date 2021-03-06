# Em, CLI front end for Emacs and emacsclient
The __em__ script runs `emacs(1)` and/or `emacsclient(1)` as appropriate per
given command-line arguments. For interactive sessions, `emacs(1)` is
started in daemon mode as necessary prior to running `emacsclient(1)`.

When running Emacs in multiple virtual/pseudo terminals (e.g., via
ssh(1)), each terminal requires a separate Emacs daemon for I/O. The
__em__ script attempts to address this via a heuristic
by setting a unique server name for each terminal.

Invoking __em__ with multiple _FILE_ arguments opens, by default,
_FILEs_ in the top-most frame either sequentially, via the
`server-edit` (`C-x #`) command, or randomly, via `switch-to-buffer`
(`C-x b`).

In addition to command-line options from either `emacs(1)` or `emacsclient(1)`,
the following options are recognized:

  OPTION                      | DESCRIPTION
  -----------------------     |------------
  --buffer[=BUF]              | Visit buffer _BUF_ if given, otherwise `*scratch*`.
  --dired[=DIR]               | Visit directory _DIR_ if given, otherwise `.`.
  --markdown, -md=FILE        | Visit _FILE_ in mode `markdown-live-preview-mode`.
  --new-frame                 | Visit FILEs in a new frame.
  --preload-files             | Load _FILEs_ in parallel, but visit one at a time.
  --many-frames               | Visit _FILEs_ in parallel, each in its own frame.
  --save-kill                 | Save buffers and kill Emacs and Emacs server.
  --ssh=[USER@]HOST[:PATH]    | Visit _PATH_ on remote _HOST_ via SSH.
  --ssu=[USER@]HOST[:PATH]    | Visit _PATH_ with SUDO on remote _HOST_ via SSH.
  --super-user                | Visit _FILEs_ with _root_ privileges via tramp.
  --trace                     | Trace execution of __em__ script.
  --two-way-merge=F1,F2[,OUT] | Call __emerge-files__ with file args F1 and F2.
  --update-loaddefs[=DIR]     | Build autoload file _DIR-loaddefs.el_.
  --wait                      | Run `emacsclient(1)` in foreground.

Options may be abbreviated (e.g., `-new` instead of `--new-frame`)
provided they are unambiguous.

If __em__ is invoked with either no command-line options or
emacsclient options only, then it runs as a background process and
switches focus to the Emacs server. Otherwise, Emacs-specific
command-line options (see `emacs --help`) force a new Emacs process
to be run in the foreground, allowing this script to be invoked,
e.g., in batch mode within a Makefile.

If the environment variable `SSH_TTY` is set and the SSH client and server
differ, then the command-line option`--tty`  is enabled by default.

Similarly, if environment variable `SUDO_USER` is set and not equal to
`USER`, then command-line option `--tty` is enabled by default. Rather
than override this behavior, generally a better solution is to use
`tramp` mode. For example, if not logged in as user _root_, to edit
file _/etc/hosts_, use `em -su /etc/hosts`.

To kill the Emacs server, use `em --save-kill`, which can be shortened
to `em -sa`.

See also [FAQ](https://github.com/slewsys/emacs-cli-front-end/blob/master/FAQ.md)
for troubleshooting.
