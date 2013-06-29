class Flatmate < ActiveRecord::Base

  has_many :flatmate_group_memberships
  has_many :flatmate_groups, :through => :flatmate_group_memberships
  has_many :receiving_transactions, :through => :flatmate_groups
  has_many :giving_transactions, :through => :flatmate_groups

  #has_one  :personal_group, :class_name => "FlatmateGroup"

  prevent_destroy_if_any :receiving_transactions, :giving_transactions

  attr_accessible :flatmate_group_membership, :flatmate_group, :name, :personal_group

  validates :name, :uniqueness => true

end
