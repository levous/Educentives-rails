require 'test_helper'

class SponsorshipsControllerTest < ActionController::TestCase
  setup do
    @sponsorship = sponsorships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsorships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsorship" do
    assert_difference('Sponsorship.count') do
      post :create, sponsorship: @sponsorship.attributes
    end

    assert_redirected_to sponsorship_path(assigns(:sponsorship))
  end

  test "should show sponsorship" do
    get :show, id: @sponsorship.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsorship.to_param
    assert_response :success
  end

  test "should update sponsorship" do
    put :update, id: @sponsorship.to_param, sponsorship: @sponsorship.attributes
    assert_redirected_to sponsorship_path(assigns(:sponsorship))
  end

  test "should destroy sponsorship" do
    assert_difference('Sponsorship.count', -1) do
      delete :destroy, id: @sponsorship.to_param
    end

    assert_redirected_to sponsorships_path
  end
end
