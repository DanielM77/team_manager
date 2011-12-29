require 'spec_helper'

describe Game do
  def valid_player_attributes
    {
      :firstname => "Daniel",
      :lastname => "Müller",
      :email => "daniel.mueller@online.de",
      :mobile => "(0172) 62 40 581",
      :birthday => "18.02.1977"
    }
  end
  def valid_game_attributes
    {
      :is_accounted => false
    }
  end
  def valid_account_attributes
    {
      :name => "RSV Würges"
    }
  end
  def valid_team_attributes
    {
      :name => "RSV Würges"
    }
  end

  describe "add_bonuses_from_game"
  it "adds all account items of a given game to the account" do
    
    team = Team.create! valid_team_attributes
    bonus = team.bonuses.build
    bonus.bonus_type = "Punktpraemie"
    bonus.value = 10
    bonus.save
    team2 = Team.create! valid_team_attributes
    player = Player.create! valid_player_attributes
    account = Account.create! valid_account_attributes
    account.team = team
    account.save
    game = Game.new
    game.home = team
    game.away = team2
    game.goals_home = 1
    game.goals_away = 0
    game.game_members.build(:player => player)
    
    #expect {
     # game.calc_bonus
     
    # }.to change(game.accounted, :count)
  
    game.is_accounted = game.calc_bonus
    game.save
    game.is_accounted.should be_true
    end
end
