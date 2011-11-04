class AccountItemsController < ApplicationController
  # GET /account_items
  # GET /account_items.xml
  def index
    @account = Account.find(params[:account_id])
    @account_items = @account.account_items

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_items }
    end
  end

  # GET /account/1/account_items/1
  # GET /account/1/account_items/1.xml
  def show
    @account = Account.find(params[:account_id])
    @account_item = @account.account_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account_item }
    end
  end

  # GET /account/1/account_items/new
  # GET /account/1/account_items/new.xml
  def new
    @account = Account.find(params[:account_id])
    @account_item = @account.account_items.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /account/1/account_items/1/edit
  def edit
    @account = Account.find(params[:account_id])
    @account_item = @account.account_items.find(params[:id])
  end

  # POST /account/1/account_items
  # POST /account/1/account_items.xml
  def create
    @account = Account.find(params[:account_id])
    @account_item = @account.account_items.create(params[:account_item])
    respond_to do |format|
      if @account_item.save
        format.html { redirect_to(account_account_items_url, :notice => 'Account item was successfully created.') }
        format.xml  { render :xml => @account_item, :status => :created, :location => @account_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /account/1/account_items/1
  # PUT /account/1/account_items/1.xml
  def update
    @account_item = AccountItem.find(params[:id])

    respond_to do |format|
      if @account_item.update_attributes(params[:account_item])
        format.html { redirect_to(@account_item, :notice => 'Account item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /account/1/account_items/1
  # DELETE /account/1/account_items/1.xml
  def destroy
    @account = Account.find(params[account_id])
    @account_item = @account.account_items.find(params[:id])
    @account_item.destroy

    respond_to do |format|
      format.html { redirect_to(account_url) }
      format.xml  { head :ok }
    end
  end
end
