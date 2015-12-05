require 'test_helper'

class SynthPresetUsersControllerTest < ActionController::TestCase
  setup do
    @synth_preset_user = synth_preset_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synth_preset_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synth_preset_user" do
    assert_difference('SynthPresetUser.count') do
      post :create, synth_preset_user: { preset_id: @synth_preset_user.preset_id, user_id: @synth_preset_user.user_id }
    end

    assert_redirected_to synth_preset_user_path(assigns(:synth_preset_user))
  end

  test "should show synth_preset_user" do
    get :show, id: @synth_preset_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @synth_preset_user
    assert_response :success
  end

  test "should update synth_preset_user" do
    patch :update, id: @synth_preset_user, synth_preset_user: { preset_id: @synth_preset_user.preset_id, user_id: @synth_preset_user.user_id }
    assert_redirected_to synth_preset_user_path(assigns(:synth_preset_user))
  end

  test "should destroy synth_preset_user" do
    assert_difference('SynthPresetUser.count', -1) do
      delete :destroy, id: @synth_preset_user
    end

    assert_redirected_to synth_preset_users_path
  end
end
