class Transaction < ActiveRecord::Base
  has_many :debts
  has_many :debtors, :through => :debts, :source => :flatmate_group
  has_many :credits
  has_many :creditors, :through => :credits, :source => :flatmate_group

  attr_accessible :amount, :description, :debtors, :creditors

  validates :amount, :numericality => {:greater_than_or_equal => 0.01}
  validates :description, :amount, :debtors, :creditors, :presence => true
end
