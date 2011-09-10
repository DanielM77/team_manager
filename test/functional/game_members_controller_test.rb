require 'test_helper'

class GameMembersControllerTest < ActionController::TestCase
  setup do
    @game_member = game_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_member" do
    assert_difference('GameMember.count') do
      post :create, :game_member => @game_member.attributes
    end

    assert_redirected_to game_member_path(assigns(:game_member))
  end

  test "should show game_member" do
    get :show, :id => @game_member.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @game_member.to_param
    assert_response :success
  end

  test "should update game_member" do
    put :update, :id => @game_member.to_param, :game_member => @game_member.attributes
    assert_redirected_to game_member_path(assigns(:game_member))
  end

  test "should destroy game_member" do
    assert_difference('GameMember.count', -1) do
      delete :destroy, :id => @game_member.to_param
    end

    assert_redirected_to game_members_path
  end
end
