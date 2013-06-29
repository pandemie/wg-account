Shared flat accounting tool in Ruby on Rails
============================================

Living in a shared flat (WG for Wohngemeinschaft in german), I made a tool for
tracking debts and credits. If you and your flatmates often buy stuff for
eachother, or if you agreed upon sharing the bill for the noodles, this tool can
be useful. Whenever someone spends some money, you enter the amount of money, a
description and the creditors and debtors of that transaction. So for example if
I buy bananas worth 5€ for me and Kurt, then I will enter me on the creditor
side, and me+Kurt on the debtor side. After that I get a 2.5€ plus on my
balance, and Kurt gets 2.5€ minus. The advantage of this system is, that Kurt
does not nee to pay me back directly, he just needs to buy something for anyone
else in the flat and thus transfering his debt.

You can run this tool on your home server and anyone in your home network can
use it.

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
flats. ;) Then type ***localhost:3000*** into the adressbar of your browser and
hit enter.

Using
=====

First of all you want to create some flatmates by clicking on "Flatmates" in the
navigation bar. After that you need to create some flatmate groups. Since all
transactions are between groups of flatmates, and not between flatmates
directly, you probably want to at least create a group for every flatmate.

On the transactions page, you can add new transactions in the obvious way. The
account field also accepts simple arithmetic expressions (eg. 2.5 + 7.4 + 4.5 * 8)
