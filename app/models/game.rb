class Game < ActiveRecord::Base
  belongs_to :home, :class_name => "Team"
  belongs_to :away, :class_name => "Team"
  has_many :game_members, :dependent => :destroy
  has_many :players, :through => :game_members
  validates :goals_home,:numericality => {:greater_than_or_equal_to => 0} 
  validates :goals_away,:numericality => {:greater_than_or_equal_to => 0} 
end
