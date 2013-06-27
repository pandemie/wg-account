class Flatmate < ActiveRecord::Base

  has_many :flatmate_group_memberships
  has_many :flatmate_groups, :through => :flatmate_group_memberships
  has_many :receiving_transactions, :through => :flatmate_groups
  has_many :giving_transactions, :through => :flatmate_groups

  prevent_destroy_if_any :receiving_transactions, :giving_transactions

  after_create :add_one_flatmate_group
  after_destroy :remove_one_flatmate_group

  attr_accessible :flatmate_group_membership, :flatmate_group, :name

  validates :name, :uniqueness => true

  private
    def add_one_flatmate_group
      FlatmateGroup.create!(:name => self.name, :shortname => self.name[0,1])
    end

    def remove_one_flatmate_group
      FlatmateGroup.where(:name => self.name).destroy_all
    end
end
