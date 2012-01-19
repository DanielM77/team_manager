class Training < ActiveRecord::Base
  default_scope :order => 'training_date DESC'
  has_many :training_members, :dependent => :destroy
  has_many :players, :through => :training_members
  def calc_refund
    #fahrtkosten
    #refund = Refund.where("refund_type = 'Trainingsfahrten'")
    #logger.debug("Refund #{refund.inspect}")
    #@min_base_value = refund.min_base_value
    players.each do |player|
      logger.debug("Team of #{player.lastname} #{player.team.inspect}")
      unless player.team.nil?
        refund = player.team.refunds.find_by_refund_type("Trainingsfahrten")        
        unless refund.nil?  
          logger.debug("Refund of #{player.team.name} is #{refund.inspect}")
          if refund.is_refundable_distance(player.distance)
            unless player.team.account.nil?
              logger.debug("About to account")
              account_item = player.team.account.account_items.build
              account_item.item_type = refund.refund_type
              account_item.player = player
              account_item.value = refund.value * player.distance
              account_item.item_date = training_date
              logger.debug ("Account item about to save: #{account_item.inspect}")
              is_saved = account_item.save
              logger.debug ("Account item isd saved: #{is_saved}")
            
            end
          end
        end
      end
    end
  end
end
