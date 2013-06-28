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
need *ruby* and *ruby on rails*. Until I find out how to get rid of most of the
following steps, please do the following:

1. git clone https://github.com/pandemie/wg-account.git
2. cd wg-account
3. gem install simple-navigation
4. gem install prevent\_destroy\_if\_any
5. bundle install
3. $> rake db:create
3. $> rake db:migrate
4. $> rails s

The last point start the debug server, which is frankly enough for most
flats. ;) Then type ***0.0.0.0:3000*** into the adressbar of your browser and
hit enter.

Using
=====

First of all you want to create some flatmates by clicking on "Flatmates" in the
navigation bar. After that you can create a flatmate group, for example a group
for all flatmates.

On the transactions page, you can add new transactions in the obvious way. The
account field also accepts simple arithmetic expressions (eg. 2.5 + 7.4  + 4.5 * 8)
