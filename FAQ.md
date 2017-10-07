# Questions and Answers

## Q: Why does `./configure` fail, e.g. with "WARNING: 'automake-1.xx' is missing on your system."?
A: `git(1)` does not preserve timestamps, so `autoconf(1)` is trying to
   rebuild _aclocal.m4_ and friends. To prevent this, run `touch(1)` first:

```bash
touch configure.ac aclocal.m4 configure Makefile.am Makefile.in
./configure
make && sudo make install
```

   For details on why preserving timestamps with `git(1)` would be problematic,
   see [GitWiki](https://git.wiki.kernel.org/index.php/Git_FAQ#Why_isn.27t_Git_preserving_modification_time_on_files.3F).

## Q: Why doesn't `gpg(1)` (GNUPG) prompt for a password in the terminal (e.g., in Magit mode when signing a commit)?
A: __Emacs__ can become detached from the terminal, especially in a graphical
   environment. A better solution is provided by __Emacs  25.1__,
   which can prompt for a passphrase in the minibuffer.

   To enable this, install __Pinentry 0.9.5__ or later, and configure
   loopback mode in `gpg-agent(1)` by adding two lines to
   _~/.gnupg/gpg-agent.conf_:

```
allow-emacs-pinentry
allow-loopback-pinentry
 ```

   Reload `gpg-agent(1)`:

```bash
gpgconf --reload gpg-agent
```

   then add two lines to _~/.emacs_:

```
(setq epa-pinentry-mode 'loopback)
(pinentry-start)
```

   and restart `emacs(1)`. Finally, a big thank-you to __Oliver Scholz__ for providing
   this answer on [StackExchange](https://emacs.stackexchange.com/questions/32881/enabling-minibuffer-pinentry-with-emacs-25-and-gnupg-2-1-on-ubuntu-xenial).

## Q: On __macOS__, after switching to another user ID on the command line, why does `emacsclient(1)` fail, e.g. with "Connection refused"?
A: This can be caused by the environment variable `TMPDIR` not being
   defined. In particular, `TMPDIR` must be set prior to running
   `emacs(1)` in daemon mode. See the file _./contrib/set-tmpdir.sh_
   for a solution.
