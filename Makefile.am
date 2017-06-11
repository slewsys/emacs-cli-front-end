# Makefile.am: Src subdirectory automake template for the ed line editor.
#
# Copyright © 1993-2016 Andrew L. Moore, SlewSys Research
#
# Process this file with automake to create Makefile.in

bin_SCRIPTS = em
AM_DEFAULT_SOURCE_EXT = .in

man_MANS = $(bin_SCRIPTS:=.1)
EXTRA_DIST = $(man_MANS)

clean-local:
	rm -f em *~ ./#*
