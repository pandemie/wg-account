# -*- coding: utf-8 -*-
require 'bigdecimal'

# -*- coding: utf-8 -*-
module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def transaction_balance
    @balance_array = []
    for flatmate in Flatmate.all
      @has_given = BigDecimal.new("0")
      @has_taken = BigDecimal.new("0")
      for t in flatmate.giving_transactions
        @creditors_size = BigDecimal.new(groups_to_flatmates(t.creditors).size)
        @has_given += (BigDecimal.new(t.amount) / @creditors_size)
      end
      for t in flatmate.receiving_transactions
        @debtors_size = BigDecimal.new(groups_to_flatmates(t.debtors).size)
        @has_taken += (BigDecimal.new(t.amount) / @debtors_size)
      end
      @balance = @has_given - @has_taken
      @balance_array << {:name => flatmate.name, :amount => @balance}
    end
    return @balance_array
  end

  def number_to_euro(number)
    return number_to_currency(number, :unit => "€", :separator => ",", :delimiter => ".", :format => "%n%u")
  end

  def sum_of_balances
    return transaction_balance.inject(0) { |acc, item| item[:amount] + acc }
  end

  def awk_abrechnung
    ft = File.open('/tmp/tmp_transactions.txt', 'w')
    old_transactions.each do |line|
       ft.write(line + "\n")
    end
    ft.close
    `awk -f ~/abrechnen/abrechenProgramm/abrechnen.awk '/tmp/tmp_transactions.txt' | grep -A100 "==Abrechnung vom" > /tmp/tmp_balance.txt`
    @lines = []
    File.open("/tmp/tmp_balance.txt", "r").each_line do |line|
      @lines << line
    end
    return @lines
  end

  def groups_to_flatmates(groups)
    @flatmates = []
    for group in groups
      for flatmate in group.flatmates
        @flatmates << flatmate
      end
    end
    return @flatmates
  end

  def write_transaction_to_log(description, t)
    File.open("/home/wg/wgtool/transactions.log", "a") do |file|
      @debtors_string =  t.debtors.collect { |f| f.shortname }.join '+'
      @creditors_string =  t.creditors.collect { |f| f.shortname }.join '+'
      @line = @debtors_string + "->" + @creditors_string + " " + currency_str(t.amount) + " " + t.description
      @line +=  " - " + description + " - " + Time.now.strftime("%d.%m.%Y %H:%M")
      file.puts(@line)
    end
  end

  def old_transactions
    @text = []

    for t in Transaction.all
      @debtors_string =  t.debtors.collect { |f| f.shortname }.join '+'
      @creditors_string =  t.creditors.collect { |f| f.shortname }.join '+'

      @line = @debtors_string + "->" + @creditors_string + " " + currency_str(t.amount) + " " + t.description
      @text << @line
    end
    return @text
  end

  def currency_str(amount)
    number_to_currency(amount, :unit => "€", :separator => ",", :delimiter => ".", :format => "%n%u")
  end


end
