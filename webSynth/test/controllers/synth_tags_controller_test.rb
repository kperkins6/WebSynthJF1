require 'test_helper'

class SynthTagsControllerTest < ActionController::TestCase
  setup do
    @synth_tag = synth_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synth_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synth_tag" do
    assert_difference('SynthTag.count') do
      post :create, synth_tag: { str: @synth_tag.str, synth_id: @synth_tag.synth_id }
    end

    assert_redirected_to synth_tag_path(assigns(:synth_tag))
  end

  test "should show synth_tag" do
    get :show, id: @synth_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @synth_tag
    assert_response :success
  end

  test "should update synth_tag" do
    patch :update, id: @synth_tag, synth_tag: { str: @synth_tag.str, synth_id: @synth_tag.synth_id }
    assert_redirected_to synth_tag_path(assigns(:synth_tag))
  end

  test "should destroy synth_tag" do
    assert_difference('SynthTag.count', -1) do
      delete :destroy, id: @synth_tag
    end

    assert_redirected_to synth_tags_path
  end
end
