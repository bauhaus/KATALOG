require 'test_helper'

class ThingListsControllerTest < ActionController::TestCase
  setup do
    @thing_list = thing_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thing_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thing_list" do
    assert_difference('ThingList.count') do
      post :create, :thing_list => @thing_list.attributes
    end

    assert_redirected_to thing_list_path(assigns(:thing_list))
  end

  test "should show thing_list" do
    get :show, :id => @thing_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @thing_list.to_param
    assert_response :success
  end

  test "should update thing_list" do
    put :update, :id => @thing_list.to_param, :thing_list => @thing_list.attributes
    assert_redirected_to thing_list_path(assigns(:thing_list))
  end

  test "should destroy thing_list" do
    assert_difference('ThingList.count', -1) do
      delete :destroy, :id => @thing_list.to_param
    end

    assert_redirected_to thing_lists_path
  end
end
