require 'test_helper'

class AccountItemsControllerTest < ActionController::TestCase
  setup do
    @account_item = account_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_item" do
    assert_difference('AccountItem.count') do
      post :create, :account_item => @account_item.attributes
    end

    assert_redirected_to account_item_path(assigns(:account_item))
  end

  test "should show account_item" do
    get :show, :id => @account_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @account_item.to_param
    assert_response :success
  end

  test "should update account_item" do
    put :update, :id => @account_item.to_param, :account_item => @account_item.attributes
    assert_redirected_to account_item_path(assigns(:account_item))
  end

  test "should destroy account_item" do
    assert_difference('AccountItem.count', -1) do
      delete :destroy, :id => @account_item.to_param
    end

    assert_redirected_to account_items_path
  end
end
