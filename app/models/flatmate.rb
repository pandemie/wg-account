class Flatmate < ActiveRecord::Base

  has_many :flatmate_group_memberships
  has_many :flatmate_groups, :through => :flatmate_group_memberships
  has_many :receiving_transactions, :through => :flatmate_groups
  has_many :giving_transactions, :through => :flatmate_groups

  has_one  :personal_group, :class_name => "FlatmateGroup"

  prevent_destroy_if_any :receiving_transactions, :giving_transactions

  before_save :build_default_flatmate_group

  attr_accessible :flatmate_group_membership, :flatmate_group, :name, :personal_group

  validates :name, :uniqueness => true

  private

    def build_default_flatmate_group
#      g = FlatmateGroup.create!(:name => self.name, :shortname => self.name, :is_active => true, :is_personal => true)
#      g.flatmates << self
#      self.personal_group = g
#      g.save
      true
    end

end
