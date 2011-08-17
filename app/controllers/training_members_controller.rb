class TrainingMembersController < ApplicationController
  # GET /training_members
  # GET /training_members.xml
  def index
    @training_members = TrainingMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @training_members }
    end
  end

  # GET /training_members/1
  # GET /training_members/1.xml
  def show
    @training_member = TrainingMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training_member }
    end
  end

  # GET /training_members/new
  # GET /training_members/new.xml
  def new
    @training_member = TrainingMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training_member }
    end
  end

  # GET /training_members/1/edit
  def edit
    @training_member = TrainingMember.find(params[:id])
  end

  # POST /training_members
  # POST /training_members.xml
  def create
    player = Player.find(params[:player_id])
    training = Training.find(params[:training_id])
    @training_member = training.training_members.build(:player => player)
    respond_to do |format|
      if @training_member.save
        format.html { redirect_to(@training_member.training, :notice => 'Training member was successfully created.') }
        format.xml  { render :xml => @training_member, :status => :created, :location => @training_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /training_members/1
  # PUT /training_members/1.xml
  def update
    @training_member = TrainingMember.find(params[:id])

    respond_to do |format|
      if @training_member.update_attributes(params[:training_member])
        format.html { redirect_to(@training_member, :notice => 'Training member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /training_members/1
  # DELETE /training_members/1.xml
  def destroy
    @training_member = TrainingMember.find(params[:id])
    @training = @training_member.training
    if @training_member.destroy
      respond_to do |format|
        format.html { redirect_to(:back, :notice => 'Training member was successfully deleted.') }
        format.xml  { head :ok }
      end
    end
  end
end
