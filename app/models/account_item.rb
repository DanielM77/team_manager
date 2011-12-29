class AccountItem < ActiveRecord::Base
  belongs_to :account
  belongs_to :player
  ITEM_TYPES = ["Punktpraemie", "Auflaufpraemie","Anfangsformation","Einwechselung",
    "im 18er Kader ohne Einsatz","Einsatzpraemie sonstige","Auslagen","Abrechnung Vereinsheim",
    "Fahrtkosten"]
  validates :item_type, :inclusion => ITEM_TYPES
end
