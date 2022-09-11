# Questions and Answers

## Q: Why doesn't `gpg` (**GnuPG**) prompt for a password in the terminal?

A: An **Emacs** command requiring a **GnuPG** passphrase, such as
   signing a commit in **Magit** mode, can fail in a graphical
   environment if **Emacs** becomes detached from the terminal and is
   virtually impossible when running **Emacs** in terminal mode due to
   I/O contention. A better solution is to have **Emacs** prompt for
   the passphrase in a minibuffer.

   To enable this, add to the file *~/.gnupg/gpg.conf* a line:

```
pinentry-mode loopback
```

   and to *~/.gnupg/gpg-agent.conf* a line:

```
allow-loopback-pinentry
```

   Now, reload `gpg-agent`:

```
gpgconf --reload gpg-agent
```

   Finally, restart **Emacs**. That's it!

## Q: Why can't `emacsclient` be invoked after switching user ID?

A: On macOS, after switching to another user ID via `sudo`,
   `emacsclient` might fail with an error such as:

```
Connection refused
```

   This can be caused by the environment variable `TMPDIR` not being
   defined. In particular, `TMPDIR` must be set prior to running
   **Emacs** in daemon mode. See the file _./contrib/set-tmpdir.sh_ for a
   solution.

## Q: `Waiting for Emacs...` and then nothing happens?

A: If logged in via multiple virtual/pseudo terminals, then the file
   may be opened in the first terminal from which **em** was invoked.
   To be able to edit in each virtual terminal separately, invoke
   **em** with the `emacsclient` option `-s` and an option argument
   uniquely corresponding to each virtual terminal.

   In tty `/dev/ttyv1`, for instance, **em** might be invoked (and
   always thereafter) as:

```bash
em -s v1 [...]
```

   while in tty `/dev/ttyv2` **em** might be invoked (and always
   thereafter) as:

```bash
em -s v2 [...]
```

   NB: The **em** script attempts to set a unique server name as appropriate
   for console-based I/O in the function `set-for-console`.
