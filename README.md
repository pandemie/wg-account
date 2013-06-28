Shared flat accounting tool in Ruby on Rails
============================================

Living in a shared flat (WG for Wohngemeinschaft in german), I made a tool to
track who owes how much to whom. You can run this tool on your home server and
anyone in your home network can use it.

This is my first Ruby on Rails project so please be forgiving whlie testing and
let me know what to improve.

Features
========

You can define single flatmates and put them into flatmate groups. Then you can
define transactions between flatmates and groups of flatmates.

Besides the list of all transactions you can always see the live balance of each
flatmate.

Running
=======

I tested it only on debian, so no guarantees for other OS. Obviously you also
need *ruby* and *ruby on rails*.

1. clone the repo
2. navigate into the wg-account directory
3. $> rake db:create
3. $> rake db:migrate
4. $> rails s

The last point start the debug server, which is frankly enough for most flats. ;)
