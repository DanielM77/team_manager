# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
team = Team.find_by_name('RSV Würges II')
Refund.create(:team => team ,:value => 0.3, :refund_type => 'Traingsfahrt', 
              :min_base_value => 10, :max_base_value => 99,
              :is_shared => false)
Refund.create(:team => team,:value => 0.3, :refund_type => 'Auswärtsfahrt', 
              :min_base_value => 0, :max_base_value => 4,
              :is_shared => true)