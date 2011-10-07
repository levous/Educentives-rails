require 'test_helper'

class AdvocaciesControllerTest < ActionController::TestCase
  setup do
    @advocacy = advocacies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:advocacies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advocacy" do
    assert_difference('Advocacy.count') do
      post :create, advocacy: @advocacy.attributes
    end

    assert_redirected_to advocacy_path(assigns(:advocacy))
  end

  test "should show advocacy" do
    get :show, id: @advocacy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advocacy.to_param
    assert_response :success
  end

  test "should update advocacy" do
    put :update, id: @advocacy.to_param, advocacy: @advocacy.attributes
    assert_redirected_to advocacy_path(assigns(:advocacy))
  end

  test "should destroy advocacy" do
    assert_difference('Advocacy.count', -1) do
      delete :destroy, id: @advocacy.to_param
    end

    assert_redirected_to advocacies_path
  end
end
