require 'spec_helper'

describe Bonus do
  def valid_player_attributes1
    {
      :firstname => "Daniel",
      :lastname => "Müller",
      :email => "daniel.mueller@online.de",
      :mobile => "(0172) 62 40 581",
      :birthday => "18.02.1977"
    }
  end
  def valid_player_attributes2
    {
      :firstname => "Daniel",
      :lastname => "Müller",
      :email => "daniel.mueller@online.de",
      :mobile => "(0172) 62 40 581",
      :birthday => "18.02.1977"
    }
  end
  def valid_shared_bonus_attributes 
    {
      :bonus_type => "Punktpraemie",
      :value => 10,
      :max_players => 1,
      :is_shared => true
    }
  end
  

describe "share"
  it "shares a given bonus among players, if player exeed maximum" do
      player1 = Player.create! valid_player_attributes1
      player2 = Player.create! valid_player_attributes2   
      players = [player1, player2]
      bonus = Bonus.new valid_shared_bonus_attributes
      bonus.share(players).should == 5
  end
end