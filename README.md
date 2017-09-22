# Em, CLI front end for Emacs and emacsclient
The __em__ script runs `emacs(1)` and/or `emacsclient(1)` as appropriate per
given command-line arguments. For interactive sessions, `emacs(1)` is
started in daemon mode as necessary prior to running `emacsclient(1)`.

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

If the environment variable `SSH_TTY` is set, and the SSH client and server
differ, then the command-line option`--tty`  is enabled by default.

To kill the Emacs server, use `em --save-kill`, which can be shortened
to `em -sa`.
