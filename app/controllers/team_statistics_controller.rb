class TeamStatisticsController < ApplicationController
  def index
    @players = Player.all
  end

end
