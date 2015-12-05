require 'test_helper'

class SynthPresetsControllerTest < ActionController::TestCase
  setup do
    @synth_preset = synth_presets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synth_presets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synth_preset" do
    assert_difference('SynthPreset.count') do
      post :create, synth_preset: { filename: @synth_preset.filename, private: @synth_preset.private, user_id: @synth_preset.user_id }
    end

    assert_redirected_to synth_preset_path(assigns(:synth_preset))
  end

  test "should show synth_preset" do
    get :show, id: @synth_preset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @synth_preset
    assert_response :success
  end

  test "should update synth_preset" do
    patch :update, id: @synth_preset, synth_preset: { filename: @synth_preset.filename, private: @synth_preset.private, user_id: @synth_preset.user_id }
    assert_redirected_to synth_preset_path(assigns(:synth_preset))
  end

  test "should destroy synth_preset" do
    assert_difference('SynthPreset.count', -1) do
      delete :destroy, id: @synth_preset
    end

    assert_redirected_to synth_presets_path
  end
end
