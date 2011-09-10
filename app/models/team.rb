class Team < ActiveRecord::Base
  has_many :games
  has_many :bonuses, :dependent => :destroy
  accepts_nested_attributes_for :bonuses, :allow_destroy => true
  validates :name, :presence => true
  validates_associated :bonuses
end
