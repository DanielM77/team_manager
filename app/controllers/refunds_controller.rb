class RefundsController < ApplicationController
  before_filter :setup_team
  
  def setup_team
    @team = Team.find(params[:team_id])
  end
  # GET /refunds
  # GET /refunds.xml
  def index
    @refunds = @team.refunds
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @refunds }
    end
  end

  # GET /refunds/1
  # GET /refunds/1.xml
  def show
    @refund = @team.refunds.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @refund }
    end
  end

  # GET /refunds/new
  # GET /refunds/new.xml
  def new
    @refund = @team.refunds.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @refund }
    end
  end

  # GET /refunds/1/edit
  def edit
    @refund = @team.refunds.find(params[:id])
  end

  # POST /refunds
  # POST /refunds.xml
  def create
    @refund = @team.refunds.new(params[:refund])

    respond_to do |format|
      if @refund.save
        format.html { redirect_to(team_refunds_path, :notice => 'Refund was successfully created.') }
        format.xml  { render :xml => @refund, :status => :created, :location => @refund }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @refund.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /refunds/1
  # PUT /refunds/1.xml
  def update
    @refund = @team.refunds.find(params[:id])

    respond_to do |format|
      if @refund.update_attributes(params[:refund])
        format.html { redirect_to(team_refund_path, :notice => 'Refund was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @refund.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /refunds/1
  # DELETE /refunds/1.xml
  def destroy
    @refund = Refund.find(params[:id])
    @refund.destroy

    respond_to do |format|
      format.html { redirect_to(refunds_url) }
      format.xml  { head :ok }
    end
  end
end
