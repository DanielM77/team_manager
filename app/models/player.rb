class Player < ActiveRecord::Base
has_many :training_members, :dependent => :destroy
has_many :game_members,     :dependent => :destroy
has_many :trainings,        :through => :training_members
has_many :games,            :through => :game_members
default_scope :order => 'lastname'
validates :lastname, :firstname, :email, :mobile, :presence => true
validates :lastname, :firstname, :email, :street, :zip_code, :city, :length => {:maximum => 100}
validates :birthday, :format => {
              :with => /(\d+)(.)(\d+)(.)(\d+)/,
              :message => 'must match the format 18.02.1977'
          }
validates :email, :format => {
              :with => /\w(@)\w(.)\w/,
              :message => 'email is not valid'

          }
end
