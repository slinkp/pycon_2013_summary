.. include:: <s5defs.txt>

========================
PyCon 2013
========================


.. class:: center

  Quick summary

  paul@bit.ly


The elephant in the room
==========================

.. class:: incremental center

  Nope.


Community
===========

  .. image:: http://static.tumblr.com/34048f704d210cde027e06cc77c8316f/iyst6gu/D8Dmk9tcd/tumblr_static_pycon_header.jpg

.. class:: incremental small

  2003: approx 200 attendees.

  2008: 1000+, maybe 1% women?

  2013: 2500, 20% women, 6 tracks of talks

  .. class:: tiny

  if very determined, you will miss only 96 out of 126 sessions


Kids / Education
=================

.. image:: https://pbs.twimg.com/media/BGUF6-nCAAENrL4.jpg:medium

http://pycon.blogspot.com/2013/03/how-kids-stole-show-young-coders.html


Swag
=====


.. class:: incremental center

 .. image:: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD771ygWnMso7vuty6YbRE-9tnU-A5zR2WT43ufiQtrZ362P8I
    :align: center

 .. image:: https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRCWLEZ2-WBxTWkeLXWI96Aghk7ELgJ7Ta8jlZXkP_h6ao0d7d8
    :align: center

 yes you can use mine

TALKS
=======

Apparently __init__ is pronounced:

 .. class:: incremental

  "Dunder init"

Death by a Thousand Leaks
==========================

Static analysis: if bitly has C extensions to python, we should look at
cpychecker; catches a lot of common problems.

http://gcc-python-plugin.readthedocs.org/en/latest/cpychecker.html

Slides: https://speakerdeck.com/pyconslides/death-by-a-thousand-leaks-by-david-malcolm

Video: http://pyvideo.org/video/1698/death-by-a-thousand-leaks-what-statically-analys


All Singing All Dancing Python Bytecode
=======================================

Slides: https://speakerdeck.com/pyconslides/all-singing-all-dancing-python-bytecode-by-larry-hastings

Video: http://pyvideo.org/video/1777/all-singing-all-dancing-python-bytecode


How to Write an Interpreter
===============================

Video: http://pyvideo.org/video/1694/so-you-want-to-write-an-interpreter

Slides: https://speakerdeck.com/pyconslides/so-you-want-to-write-an-interpreter-by-alex-gaynor


Asset Management
==================

roughly, webassets == assetman

Slides: https://speakerdeck.com/pyconslides/asset-management-in-python-by-robert-kluin-and-beau-lyddon


Poster sessions
=================

Facebook global DNS / load-balancing

Poster sessions

================

  .. image:: http://wrongsideofmemphis.files.wordpress.com/2013/03/bfm4h2xcuae_b6p-jpg-large.jpeg?w=300&h=225

Code by Voice
=============

17:15

.. raw:: html

  <iframe width="420" height="315" src="http://www.youtube.com/embed/8SkdfdXWYaI" frameborder="0" allowfullscreen></iframe>

Logical Failures
=================

Logic primer for programmers.

"It works on my machine"

Slides https://speakerdeck.com/pyconslides/logical-failures

Video http://www.pyvideo.org/video/1753/logical-failures

API Design for Library Authors
================================

"yo-yo problem"

Exercise for the reader: in ``pro_api/app/pro.py``:
look at ``GetClicks``.
Follow the call chain from ``GetClicks.get()`` until a template is rendered.

.. class:: incremental small

  - class 'app.pro.GetClicks'
  - class 'app.pro.DecodeBaseHandler'
  - class 'app.pro.EnterpriseHandler'
  - class 'app.pro.ProBaseHandler'
  - class 'app.basic.BaseHandler'
  - class 'tornado.web.RequestHandler'
  - class 'app.ctron_accessors.ClickatronMixin'
  - class 'lib.ArgumentMixin.ArgumentMixin'
  - class 'libbitly.statsd_proxy.TimingMetricsMixin'
  - class 'libbitly.statsd_proxy.TimingMetrics'
  - type 'object'


EduPsych Theory for Python Hackers: A Whirlwind Overview
=========================================================

Explaining the value of hacking to academics.

Video: http://www.youtube.com/watch?v=D9XJ9K3jfKk


How to Except When You're Excepting
===================================

Video http://www.pyvideo.org/video/1680/how-to-except-when-youre-excepting

Slides https://speakerdeck.com/pyconslides/how-to-except-when-youre-excepting-by-esther-nam

I need to remember ``contextlib.contextmanager``.


Guido's keynote: Async I/O in Python 3.4
========================================

Slides: https://www.dropbox.com/s/xknbe58zcvjhzhv/PyCon2013.pptx

.. class:: incremental

  .. image:: http://imgs.xkcd.com/comics/standards.png
     :align: center


Async IO: background
=====================

1) *execution model* that allows IO bound applications to handle 10,000s of open
sockets concurrently w/o tons of threads or processes.

2) *programming models:* APIs and language constructs that
support using IO asynchronously.

Async IO in Python: Current Problems (1)
========================================

Execution model: Too many similar but incompatible async implementations.

Tornado != Twisted != ZeroMQ != ...

.. class:: incremental

  My main loop is the one true main loop. Go away!


Async IO in Python: Current Problems (2)
========================================

Progamming model: Multiple competing and very different programming models.

* explicit (Tornado, Twisted, ...)

  - lots of callbacks and/or deferred objects

* *or* implicit (Gevent)

  - looks just like synchronous code

  - magic!

Async: Guido's Proposal
============================

PEP 3156 addresses only problem 1: execution model.

.. class:: incremental

  .. image:: http://imgs.xkcd.com/comics/standards.png
     :align: center

Async: Proposal (cont'd)
==========================

.. class:: incremental

 - Python 3.4 std lib will provide default IO loop implementation and API.

 - Frameworks will be able to write adapters to/from it.

 - Main program can choose which loop to use and adapt all others to it.

 - Win: run Tornado, Twisted, ZeroMQ, ... in one process

BUT
======

Still 2 programming models.

PEP 3156 chooses an explicit approach.

Gevent, Eventlet, Stackless, ... : kind of left out in the cold

Standard library will remain synchronous for now.  There may eventually be
async versions of lots of APIs.  Duplication, ugh.

No fun for frameworks doing implicit IO, eg. ORMs.


Async IO Examples: Old Tornado Style
=======================================

 .. image:: img/async_tornado.svg
    :align: left
    :width: 1200px
    :height: 1600px


Async IO Examples: tornado.gen Style
=====================================

 .. image:: img/async_tornado_gen.svg
    :align: left
    :width: 1200px
    :height: 1600px


Async IO Examples: PEP 3156 Style (I think)
==============================================

 .. image:: img/async_pep3156.svg
    :align: left
    :width: 1200px
    :height: 1600px


That's it
============

