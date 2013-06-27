require 'test_helper'

class FlatmateGroupsControllerTest < ActionController::TestCase
  setup do
    @flatmate_group = flatmate_groups(:one)
    @flatmates = [flatmates(:one), flatmates(:two)]
    @new_name = "New WG"
    @new_group = {name: "New WG", shortname: "NWG" }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flatmate_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flatmate_group" do
    assert_difference('FlatmateGroup.count') do
      post :create, { :flatmate_group => @new_group, :updated_group_members => @flatmates }
    end
    assert_redirected_to flatmate_group_path(assigns(:flatmate_group))
  end

  test "should show flatmate_group" do
    get :show, id: @flatmate_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flatmate_group
    assert_response :success
  end

  test "should update flatmate_group" do
    put :update, id: @flatmate_group, flatmate_group: {  }, updated_group_members: @flatmates
    assert_redirected_to flatmate_group_path(assigns(:flatmate_group))
  end

  test "should destroy flatmate_group" do
    assert_difference('FlatmateGroup.count', -1) do
      delete :destroy, id: @flatmate_group
    end

    assert_redirected_to flatmate_groups_path
  end
end
