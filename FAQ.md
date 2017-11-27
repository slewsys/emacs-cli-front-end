# Questions and Answers

## Q: Why does `./configure` fail?
A: After cloning a repository, running `./configure` might fail with
an error such as:

```
WARNING: 'automake-1.xx' is missing on your system
```

because `git(1)` does not preserve timestamps, which causes
`autoconf(1)` to try to rebuild _aclocal.m4_ and friends. To prevent
this, run `touch(1)` first:

```bash
touch configure.ac aclocal.m4 configure Makefile.am Makefile.in
./configure
make && sudo make install
```

For details on why preserving timestamps with `git(1)` would be
problematic, see
[GitWiki](https://git.wiki.kernel.org/index.php/Git_FAQ#Why_isn.27t_Git_preserving_modification_time_on_files.3F).

## Q: Why doesn't `gpg(1)` (GNUPG) prompt for a password in the terminal?
A: Invoking an __Emacs__ command requiring a password, such as when
working in Magit mode, can fail if __Emacs__ becomes detached from the
terminal, especially in a graphical environment. A better solution is
provided via the Emacs ELPA package `pinentry` which can prompt for a
passphrase in the minibuffer.

To enable this, install __Pinentry 0.9.5__ or later, and configure
loopback mode in `gpg-agent(1)` by adding two lines to
_~/.gnupg/gpg-agent.conf_:

```
allow-emacs-pinentry
allow-loopback-pinentry
 ```

   Reload `gpg-agent(1)`:

```
gpgconf --reload gpg-agent
```

   Next, install `pinentry.el`, e.g., as an ELPA package via the
   __Emacs__ command:

```
M-x package-install RET
pinentry RET
```

If `pinentry.el` is not yet available as an ELPA package, then just
copy the file _./contrib/pinentry.el_ into __Emacs__ load-path. Once
`pinentry.el` is installed, add these lines to _~/.emacs_:

```
(require 'pinentry)

(setq epa-pinentry-mode 'loopback)
(pinentry-start)
```

then restart __Emacs__. Finally, a big thank-you to __Oliver Scholz__
for providing this answer on
[StackExchange](https://emacs.stackexchange.com/questions/32881/enabling-minibuffer-pinentry-with-emacs-25-and-gnupg-2-1-on-ubuntu-xenial).

## Q: Why can't `emacsclient(1)` be invoked after switching user ID?
A: On macOS, after switching to another user ID via `sudo(1)`,
`emacsclient(1)` might fail with an error such as:

```
Connection refused
```

This can be caused by the environment variable `TMPDIR` not being
defined. In particular, `TMPDIR` must be set prior to running
__Emacs__ in daemon mode. See the file _./contrib/set-tmpdir.sh_ for a
solution.
