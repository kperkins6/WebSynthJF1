require 'test_helper'

class SequencerPresetsControllerTest < ActionController::TestCase
  setup do
    @sequencer_preset = sequencer_presets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequencer_presets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequencer_preset" do
    assert_difference('SequencerPreset.count') do
      post :create, sequencer_preset: { filename: @sequencer_preset.filename, private: @sequencer_preset.private, user_id: @sequencer_preset.user_id }
    end

    assert_redirected_to sequencer_preset_path(assigns(:sequencer_preset))
  end

  test "should show sequencer_preset" do
    get :show, id: @sequencer_preset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequencer_preset
    assert_response :success
  end

  test "should update sequencer_preset" do
    patch :update, id: @sequencer_preset, sequencer_preset: { filename: @sequencer_preset.filename, private: @sequencer_preset.private, user_id: @sequencer_preset.user_id }
    assert_redirected_to sequencer_preset_path(assigns(:sequencer_preset))
  end

  test "should destroy sequencer_preset" do
    assert_difference('SequencerPreset.count', -1) do
      delete :destroy, id: @sequencer_preset
    end

    assert_redirected_to sequencer_presets_path
  end
end
