Bustle 0.4.8 (2015-03-22)
-------------------------

* Be compatible with recent versions of Gtk2HS which use Text rather
  than Strings in many places. Should still build against older
  releases. Let me know if not.
* [#89712][]: Add symbolic icon. (Arnaud Bonatti)

[#89712]: https://bugs.freedesktop.org/show_bug.cgi?id=89712


Bustle 0.4.7 (2014-07-19)
-------------------------

* Ship the icons in the tarball! Thanks again, Sergei Trofimovich.


Bustle 0.4.6 (2014-07-17)
-------------------------

* Icons! Thanks to Αποστολίδου Χρυσαφή for redrawing the icon as an SVG, and to
  Philip Withnall for the build system goop.
* More appdata! Thanks again, Philip.

Bustle 0.4.5 (2014-02-26)
-------------------------

* Fix build failure with tests enabled due to translation files.
* Distribute appdata and desktop files in source tarballs.

Thanks to Sergei Trofimovich for catching and fixing these!


Bustle 0.4.4 (2014-01-30)
-------------------------

Wow, I can't believe the first release was in 2008!

* Bustle's now translatable. It only ships with an English translation,
  but others are more than welcome! Thanks to Philip Withnall for
  getting this started.
* Add an AppData and .desktop file. (Philip Withnall)


Bustle 0.4.3 (2013-12-05)
-------------------------

I think you mean ‘fewer crashy’.

* Don't crash on i386 when opening the stats pane. Thanks to Sujith
  Sudhi for reporting this issue.
* [#54237][]: Don't crash if we can't connect to the bus.
* Don't crash the second time you try to record a log. I swear this
  didn't happen before.

[#54237]: https://bugs.freedesktop.org/show_bug.cgi?id=54237

Bustle 0.4.2 (2012-11-14)
-------------------------

This release is all about build fixes; nothing user-visible has changed.

* The Makefile now respects the `DESTDIR` variable.
* No more deprecation warnings about `g_thread_create()`!
* We explicitly check for GLib ≥ 2.26.

Also, there's now a `threaded` Cabal flag you can turn off if you're
building for some platform where the threaded GHC runtime isn't
available (such as S/390, MIPS or Sparc). This is the same approach used
to make several other packages build for those architectures in Debian,
as per [bug 541848][]. You can do something like this in your packaging:

    DEB_SETUP_GHC_CONFIGURE_ARGS := $(shell test -e /usr/lib/ghc-$(GHC_VERSION)/libHSrts_thr.a || echo --flags=-threaded)

Bustle doesn't directly use Haskell-land threads, but I don't trust it
not to break in this configuration, so it's not the default.

[bug 541848]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=541848#33

Bustle 0.4.1 (2012-08-29)
-------------------------

Some dependency changes:

* Gtk2HS ≥ 0.12 is now required.
* Bustle now uses the [dbus][] Haskell library (≥ 0.10), which
  supersedes the [dbus-core][] package.
* `binary` is no longer required.

Some user-visible changes:

* The front page now has two big buttons rather than some [lame
  instructions][fdo44889].
* Memory usage should be a bit better, particularly for wide logs
  showing lots of applications.

Some plumbing changes:

* You can now make a symlink to the launcher script and have it work
  properly.
* Bustle [builds with GHC 7.4.1][fdo47013] (courtesy of Sergei
  Trofimovich).
* `make clean` [works][fdo47908] in source tarballs.
* `bustle-pcap` now has a man page (courtesy of Alex Merry).

[dbus]: http://hackage.haskell.org/package/dbus-0.10
[fdo44889]: https://bugs.freedesktop.org/show_bug.cgi?id=44889
[fdo47013]: https://bugs.freedesktop.org/show_bug.cgi?id=47013
[fdo47908]: https://bugs.freedesktop.org/show_bug.cgi?id=47908


Bustle 0.4.0 (2012-01-18)
-------------------------

The “let's hope my attention span lasts long enough” release.

You can now record D-Bus logs from within Bustle itself. No more faffing
around with command-line tools: just click **File → New**, and watch
the diagram being drawn as the messages trickle (or fly) in.

(If you want to capture logs from your embedded platform *du
jour*, don't fear: `bustle-pcap` is still provided as a standalone
program for your enjoyment.)

Bustle no longer [crashes when it encounters messages containing file
handles][crash-on-h]. (Those messages are now dropped; which is not
perfect, but is at least an improvement.)

Directed signals—signals with a specified destination, which are unusual
but do appear—are now shown differently to normal, undirected signals,
with an arrow pointing to the signal's recipient. Relatedly, the
monitors now [explicitly eavesdrop on messages][eavesdrop] when using
D-Bus 1.5.x, courtesy of Cosimo Alfarano.

[crash-on-h]: https://bugs.freedesktop.org/show_bug.cgi?id=44714
[eavesdrop]: https://bugs.freedesktop.org/show_bug.cgi?id=39140


Bustle 0.3.1 (2012-01-09)
-------------------------

The “How do I dress up as shared global mutable state?” release.

This release finally allows you to record complete D-Bus sessions,
including message bodies, and browse them in the user interface!

As a result, there is a new logger, `bustle-pcap`, which logs D-Bus
traffic to Pcap files; and Bustle itself now depends on the [pcap][] and
[dbus-core][] packages. Your old logs should still be loaded just fine,
but since they don't contain message body data, you won't be able to see
it in the UI.

Also, as of this release binary tarballs will be provided for those not
interested in compiling Bustle themselves.

[pcap]: http://hackage.haskell.org/package/pcap
[dbus-core]: http://hackage.haskell.org/package/dbus-core


Bustle 0.3.0
------------

You can't prove anything.


Bustle 0.2.5 (2011-06-25)
-------------------------

The “Why go all the way to Glastonbury to not watch U2 when you can just
not turn on the BBC at any point this weekend to not watch them?”
release.

This adds a sidebar with statistics about the log: namely, method call
and signal emission frequency, and total/mean times spent in method
calls. This code has mostly been sitting around unreleased since
November. Sorry, dear users!


Bustle 0.2.4 (2011-06-06)
-------------------------

The “I think I'm a panda” release. There's just a few bits and pieces of
clean-up along with a couple of bug fixes in this release. Hopefully
there will be more interesting stuff in the next release.

While we're here, Bustle's git repository has moved to freedesktop.org,
and it now has a bug tracker there too. Browse the source at
<http://cgit.freedesktop.org/bustle/>; see open bugs at
<http://wjt.me.uk/bustle/bugs>; file new ones at
<http://wjt.me.uk/bustle/new-bug>. Astonishing!

* The viewer is now much more tolerant of inconsistencies in log files.
  (Thanks to Marco Barisione for the [bug report][fdo35297].)
* The linking order for bustle-dbus-monitor is fixed. (Thanks to Sergei
  Trofimovich.)
* Miscellaneous clean-up.

[fdo35297]: https://bugs.freedesktop.org/show_bug.cgi?id=35297


Bustle 0.2.3 (2010-10-29)
-------------------------

The “Will it be a scone? Or will it be a lecture in category theory?”
release.

<div>[[!img bustle-0.2.3.png size="200x143" alt="screenshot of side-by-side session and system bus logs" class="floated screenshot"]]</div>

You can now show a session bus log and a system bus log side-by-side, with the
same time scale and with events interleaved as they happened. This might come
in useful for full-system profiling, or for frameworks where actions on one bus
lead to reactions on another.

Record the two logs as normal, by running something like:

> <kbd>% bustle-dbus-monitor --session \> session.bustle &<br/>
> % bustle-dbus-monitor --system \> system.bustle &</kbd>

Then go do whatever you want to profile. When you're done, kill the two
loggers. In Bustle, choose **File → Open a pair of logs…** to show them
side-by-side. You can save the diagram to a PDF as normal.


Bustle 0.2.2 (2010-06-29)
-------------------------

The “Shepherded” release.

Fixes:

*  Suppress messages sent to the bus by bus name, rather than object
   path. This prevents Bustle blowing up when (buggy) clients call
   methods on / rather than on /org/freedesktop/DBus. (Thanks to
   Guillaume Desmottes for reporting the issue.)

*  Build against the re-namespaced Pango in Gtk2HS 0.11, and clean up a
   tonne of warnings. I think I've kept backwards compatibility with old
   enough Gtk2HSes and GHCs for this to work with the versions in Ubuntu
   10.04 and other recent-but-not-futuristic distros, but haven't
   actually tried it. Drop me a mail in the event of landing on water.
   (Thanks to Chris Lamb for upstreaming this from Debian bug #587132.)


Bustle 0.2.1 (2009-12-02)
-------------------------

The “Going down where the Firefly goes” release.

Enhancements:

*  The handling of services with multiple well-known names has improved.
   Whereas previously one name was (essentially) randomly-chosen, now
   all names owned by a service are shown in the diagram.

*  When a service falls off the bus, its column goes away to indicate
   that.

*  Strings are now ellipsized if necessary.

*  Method returns now include the object path and method name so you
   don't have to look it up yourself.

*  The UI is less spartan: you can open files, and launch it without
   passing at least one filename as a command-line argument.

Fixes:

*  The UI handles parse errors gracefully rather than, uhm, throwing an
   exception and dying.

*  bustle-dbus-monitor now has rudimentary cross-compilation support, by
   respecting $CC and friends. (Marc Kleine-Budde)

*  You can now kill the monitor immediately with ^C, rather than waiting
   for another message to arrive. (Lennart Poettering, from a patch for
   dbus-monitor)

Notes:

*  While your old logs should continue to work with the new viewer, the
   reverse is not true: the changes to name handling required modifying
   the log format.


Bustle 0.2.0 (2009-04-03)
-------------------------

The "new monkey makes me sad :-(" release.

Enhancements:

*  Add a menu item to save a PDF of the diagram.

*  Show the elapsed time between a method call and its return.

*  Add new tools to count method calls and signals, sum the total time
   spent per method call, and generate .dot graphs (Dafydd Harries).

Fixes:

*  Don't crash on empty logs, or logs containing calls on interface
   "<none>".

*  Compile with new Gtk2HS and GHC 6.10 (Chris Lamb).


Bustle 0.1 (2008-11-13)
-----------------------

Initial release.

vim: tw=72
