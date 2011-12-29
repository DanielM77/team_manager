require 'spec_helper'
# This should return the minimal set of attributes required to create a valid
# Post. As you add validations to Post, be sure to
# update the return value of this method accordingly.
describe PlayersController do
  def valid_attributes
    {
      :firstname => "Daniel",
      :lastname => "Müller",
      :email => "daniel.mueller@online.de",
      :mobile => "(0172) 62 40 581",
      :birthday => "18.02.1977"
    }
  end

  describe "GET 'index'" do
    it "assigns all players as @players" do
      player = Player.create! valid_attributes
      get :index
      assigns(:players).should eq([player])
    end
  end

  describe "GET 'show'" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :show, :id => player.id.to_s
      assigns(:player).should eq(player)
    end  
  end
  describe "GET new" do
     it "assigns a new player as @player" do
        get :new
        assigns(:player).should be_a_new(Player)
      end
  end

  describe "GET 'edit'" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :edit, :id => player.id.to_s
      assigns(:player).should eq(player)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new player" do
        expect {
          post :create, :player => valid_attributes
        }.to change(Player, :count).by(1)
      end

      it "assigns a newly created player as @player" do
        post :create, :player => valid_attributes
        assigns(:player).should be_a(Player)
        assigns(:player).should be_persisted
      end

      it "redirects to the created player" do
        post :create, :player => valid_attributes
        response.should redirect_to(Player.last)
      end
    end
  end
  
end
