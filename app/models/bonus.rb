class Bonus < ActiveRecord::Base
  belongs_to :team
  BONUS_TYPES = ["Punktpraemie", "Auflaufpraemie","Anfangsformation","Einwechselung","im 18er Kader ohne Einsatz","Einsatzpraemie sonstige"]
  validates :bonus_type, :inclusion => BONUS_TYPES
  def share(players)
    logger.debug("Players.count: #{players.count}")
    logger.debug("Bonus.is_shared: #{is_shared}")
    if is_shared == false
      value
    elsif players.count > max_players 
        adjusted_value = value/players.count
    else
        value
    end
  end
end
