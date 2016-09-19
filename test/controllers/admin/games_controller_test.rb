require 'test_helper'

class Admin::GamesControllerTest < ActionController::TestCase
  setup do
    @admin_game = admin_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_game" do
    assert_difference('Admin::Game.count') do
      post :create, admin_game: { description: @admin_game.description, name: @admin_game.name }
    end

    assert_redirected_to admin_game_path(assigns(:admin_game))
  end

  test "should show admin_game" do
    get :show, id: @admin_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_game
    assert_response :success
  end

  test "should update admin_game" do
    patch :update, id: @admin_game, admin_game: { description: @admin_game.description, name: @admin_game.name }
    assert_redirected_to admin_game_path(assigns(:admin_game))
  end

  test "should destroy admin_game" do
    assert_difference('Admin::Game.count', -1) do
      delete :destroy, id: @admin_game
    end

    assert_redirected_to admin_games_path
  end
end
