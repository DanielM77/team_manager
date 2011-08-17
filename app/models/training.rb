class Training < ActiveRecord::Base
  default_scope :order => 'training_date DESC'
  has_many :training_members, :dependent => :destroy
  has_many :players, :through => :training_members
end
