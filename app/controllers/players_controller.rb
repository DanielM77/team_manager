class PlayersController < ApplicationController
  # GET /players
  # GET /players.xml
  def index
    @title = "Player"
    @team = Team.find(params[:team_id])
    @players = @team.players
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @title = "Player"
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @title = "Player"
    @team = Team.find(params[:team_id])
    @player = @team.players.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @title = "Player"
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @title = "Player"
    @team = Team.find(params[:team_id])
    @player = @team.players.create(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to(team_players_url, :notice => 'Player was successfully created.') }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @title = "Player"
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to(@player, :notice => 'Player was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @title = "Player"
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(team_players_url) }
      format.xml  { head :ok }
    end
  end
end
