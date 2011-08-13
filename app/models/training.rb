class Training < ActiveRecord::Base
  has_many :training_members, :dependent => :destroy
  has_many :players, :through => :training_members
end
