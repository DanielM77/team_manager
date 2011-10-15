class Account < ActiveRecord::Base
has_many :account_items, :dependent => :destroy
accepts_nested_attributes_for :account_items, :allow_destroy => true
validates :name, :presence => true
validates_associated :account_items
belongs_to :team
end
