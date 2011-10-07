require 'test_helper'

class RewardPhotosControllerTest < ActionController::TestCase
  setup do
    @reward_photo = reward_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_photo" do
    assert_difference('RewardPhoto.count') do
      post :create, reward_photo: @reward_photo.attributes
    end

    assert_redirected_to reward_photo_path(assigns(:reward_photo))
  end

  test "should show reward_photo" do
    get :show, id: @reward_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_photo.to_param
    assert_response :success
  end

  test "should update reward_photo" do
    put :update, id: @reward_photo.to_param, reward_photo: @reward_photo.attributes
    assert_redirected_to reward_photo_path(assigns(:reward_photo))
  end

  test "should destroy reward_photo" do
    assert_difference('RewardPhoto.count', -1) do
      delete :destroy, id: @reward_photo.to_param
    end

    assert_redirected_to reward_photos_path
  end
end
