class FlatmateGroup < ActiveRecord::Base
  has_many :flatmate_group_memberships
  has_many :flatmates, :through => :flatmate_group_memberships
  has_many :debts
  has_many :receiving_transactions, :through => :debts, :source => :transaction
  has_many :credits
  has_many :giving_transactions, :through => :credits, :source => :transaction

  prevent_destroy_if_any :receiving_transactions, :giving_transactions

  accepts_nested_attributes_for :flatmates

  validates :name, :shortname, :presence => true
  validates :name, :shortname, :uniqueness => true

  attr_accessible :flatmate_group_membership, :flatmate_group, :name, :debt, :credit, :shortname, :is_active
  attr_accessible :receiving_transaction, :giving_transaction
end
