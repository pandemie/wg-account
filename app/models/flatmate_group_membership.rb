class FlatmateGroupMembership < ActiveRecord::Base
  belongs_to :flatmate
  belongs_to :flatmate_group

  attr_accessible :flatmate, :flatmate_group

  validates :flatmate, :flatmate_group, :presence => true
end
