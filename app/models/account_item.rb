class AccountItem < ActiveRecord::Base
  belongs_to :account
  belongs_to :player
  ITEM_TYPES = Bonus::BONUS_TYPES << Refund::REFUND_TYPES << "Strafen" << "Vereinsheim"
  #validates :item_type, :inclusion => ITEM_TYPE
end
