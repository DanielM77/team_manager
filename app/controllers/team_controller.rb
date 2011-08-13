class TeamController < ApplicationController
  def index
  @players = Player.all
  end

end
