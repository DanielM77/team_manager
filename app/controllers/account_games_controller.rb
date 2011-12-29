class AccountGamesController < ApplicationController
  # GET /account/1/account_games
  # GET /account/1/account_games.xml
  def index
    @account = Account.find(params[:account_id])
    team_id = @account.team.id
    logger.debug("Team ID is #{team_id}")
    @account_games = Game.where("home_id = :team_id or away_id = :team_id", :team_id => team_id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_items }
    end
  end
end
