class Player < ActiveRecord::Base
has_many :training_members, :dependent => :destroy
has_many :trainings, :through => :training_members
default_scope :order => 'lastname'
end
