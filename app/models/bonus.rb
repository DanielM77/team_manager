class Bonus < ActiveRecord::Base
  belongs_to :team
  BONUS_TYPES = ["Punktpraemie", "Auflaufpraemie","Anfangsformation","Einwechselung","im 18er Kader ohne Einsatz","Einsatzpraemie sontige"]
  validates :bonus_type, :inclusion => BONUS_TYPES
end
