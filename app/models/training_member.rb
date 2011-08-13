class TrainingMember < ActiveRecord::Base
  belongs_to :training
  belongs_to :player
end
