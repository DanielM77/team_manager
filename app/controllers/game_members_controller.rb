class GameMembersController < ApplicationController
  # GET /game_members
  # GET /game_members.xml
  def index
    @game_members = GameMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @game_members }
    end
  end

  # GET /game_members/1
  # GET /game_members/1.xml
  def show
    @game_member = GameMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game_member }
    end
  end

  # GET /game_members/new
  # GET /game_members/new.xml
  def new
    @game_member = GameMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game_member }
    end
  end

  # GET /game_members/1/edit
  def edit
    @game_member = GameMember.find(params[:id])
  end

  # POST /game_members
  # POST /game_members.xml
  def create
     player = Player.find(params[:player_id])
     game = Game.find(params[:game_id])
     @game_member = game.game_members.build(:player => player)

    respond_to do |format|
      if @game_member.save
        format.html { redirect_to(@game_member.game, :notice => 'Game member was successfully created.') }
        format.xml  { render :xml => @game_member, :status => :created, :location => @game_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /game_members/1
  # PUT /game_members/1.xml
  def update
    @game_member = GameMember.find(params[:id])

    respond_to do |format|
      if @game_member.update_attributes(params[:game_member])
        format.html { redirect_to(@game_member.game, :notice => 'Game member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /game_members/1
  # DELETE /game_members/1.xml
  def destroy
    @game_member = GameMember.find(params[:id])
    @game_member.destroy

    respond_to do |format|
      format.html { redirect_to(:back, :notice => 'Game member was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  # POST /game_members/1/switch_is_driver
  def switch_is_driver
    @game_member = GameMember.find(params[:id])
    if @game_member.is_driver == true
      @game_member.is_driver = false
    else
      @game_member.is_driver = true
    end
    respond_to do |format|
      if @game_member.save
        format.html { redirect_to(@game_member.game, :notice => 'Game member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game_member.errors, :status => :unprocessable_entity }
      end
    end
  end
end
