class Bonus < ActiveRecord::Base
  belongs_to :team
  BONUS_TYPES = ["Punktpraemie", "Auflaufpraemie"]
  validates :bonus_type, :inclusion => BONUS_TYPES
end
