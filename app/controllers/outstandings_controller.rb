class OutstandingsController < ApplicationController
  before_filter :setup_account
  def setup_account
    @account = Account.find(params[:account_id])
  end
  def index
    @account_items = @account.account_items.find_all_by_item_type('Vereinsheim')
  end
  def new
  
  end
  
  def create
    
  end
  def new_all
    players = @account.team.players
    players.each {|player| @account.account_items.build }
  end
  def show
  end

  def edit
  end

  def delete
  end

end
