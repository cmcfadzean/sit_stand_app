require 'test_helper'

class DesksControllerTest < ActionController::TestCase
  setup do
    @office = offices(:one)
    @desk = desks(:one)
  end

  test "should get index" do
    get :index, params: { office_id: @office }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { office_id: @office }
    assert_response :success
  end

  test "should create desk" do
    assert_difference('Desk.count') do
      post :create, params: { office_id: @office, desk: @desk.attributes }
    end

    assert_redirected_to office_desk_path(@office, Desk.last)
  end

  test "should show desk" do
    get :show, params: { office_id: @office, id: @desk }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { office_id: @office, id: @desk }
    assert_response :success
  end

  test "should update desk" do
    put :update, params: { office_id: @office, id: @desk, desk: @desk.attributes }
    assert_redirected_to office_desk_path(@office, Desk.last)
  end

  test "should destroy desk" do
    assert_difference('Desk.count', -1) do
      delete :destroy, params: { office_id: @office, id: @desk }
    end

    assert_redirected_to office_desks_path(@office)
  end
end
