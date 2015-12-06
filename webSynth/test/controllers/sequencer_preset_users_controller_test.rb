require 'test_helper'

class SequencerPresetUsersControllerTest < ActionController::TestCase
  setup do
    @sequencer_preset_user = sequencer_preset_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequencer_preset_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequencer_preset_user" do
    assert_difference('SequencerPresetUser.count') do
      post :create, sequencer_preset_user: { preset_id: @sequencer_preset_user.preset_id, user_id: @sequencer_preset_user.user_id }
    end

    assert_redirected_to sequencer_preset_user_path(assigns(:sequencer_preset_user))
  end

  test "should show sequencer_preset_user" do
    get :show, id: @sequencer_preset_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequencer_preset_user
    assert_response :success
  end

  test "should update sequencer_preset_user" do
    patch :update, id: @sequencer_preset_user, sequencer_preset_user: { preset_id: @sequencer_preset_user.preset_id, user_id: @sequencer_preset_user.user_id }
    assert_redirected_to sequencer_preset_user_path(assigns(:sequencer_preset_user))
  end

  test "should destroy sequencer_preset_user" do
    assert_difference('SequencerPresetUser.count', -1) do
      delete :destroy, id: @sequencer_preset_user
    end

    assert_redirected_to sequencer_preset_users_path
  end
end
