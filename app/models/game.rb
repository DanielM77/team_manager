class Game < ActiveRecord::Base
  belongs_to :home, :class_name => "Team"
  belongs_to :away, :class_name => "Team"
  has_many :game_members, :dependent => :destroy
  has_many :players, :through => :game_members
  validates :goals_home,:numericality => {:greater_than_or_equal_to => 0} 
  validates :goals_away,:numericality => {:greater_than_or_equal_to => 0}
  def calc_refunds
    logger.debug("Checking for home.refunds... ")
    unless away.refunds.empty?
      refund = away.refunds.find_by_refund_type('Auswaertsfahrten')
      drivers = game_members.find_all_by_is_driver(true)
      logger.debug("REFUNDING...#{refund.inspect} ") 
      logger.debug("AWAY...#{away.inspect} ")
      drivers.each do |driver|
          account_item = away.account.account_items.build
          account_item.item_type = refund.refund_type
          account_item.player = driver.player
          account_item.value = refund.share(drivers) * home.distance
          account_item.item_date = game_date
          account_item.save
      end 
    end
  end
  def calc_bonus
    unless is_accounted?
     # Loop through all Bounties of Team and check, if there s a value for it
      # Store them in vars and then iterate through all players and add an account_item for them
      # First version with an example item_type
      #TODO: this is extremely buggy (bonus is calculated twice if both teams have bonuses)
     self.calc_refunds unless away.account.nil?
      unless home.bonuses.empty?
        unless home.account.nil?
          home.bonuses.each do |bonus|
            players.each do |player|
              account_item = home.account.account_items.build
              account_item.item_type = bonus.bonus_type
              account_item.player = player
              account_item.value = bonus.share(players)
              account_item.item_date = game_date
              account_item.save
            end    
          end
        end
      end
      unless away.bonuses.empty?
        unless away.account.nil?
          away.bonuses.each do |bonus|
            players.each do |player|
              account_item = away.account.account_items.build
              account_item.item_type = bonus.bonus_type
              account_item.player = player
              account_item.value = bonus.share(players)
              account_item.item_date = game_date
              account_item.save
            end    
          end
        end
      end
      is_accounted = true   
    end  
  end
end
