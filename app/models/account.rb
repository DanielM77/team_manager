class Account < ActiveRecord::Base
  has_many :account_items, :dependent => :destroy
  accepts_nested_attributes_for :account_items, :allow_destroy => true
  validates :name, :presence => true, :uniqueness => true
  validates_associated :account_items
  belongs_to :team
  def add_bonuses_from_game(game)
     # Loop through all Bounties of Team and check, if there s a value for it
      # Store them in vars and then iterate through all players and add an account_item for them
      # First version with an example item_type
      logger.debug "Start calculating bonus"
       team.bonuses.each do |bonus|
          game.players.each do |player|
            # First version with an example item_type
            account_item = account_items.build
            account_item.item_type = bonus.bonus_type
            account_item.player = player
            account_item.value = bonus.value
            account_item.save
          end    
        end
  end
end
