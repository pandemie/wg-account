class Debt < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :flatmate_group

  attr_accessible :transaction, :flatmate_group
end
