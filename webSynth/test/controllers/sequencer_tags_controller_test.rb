require 'test_helper'

class SequencerTagsControllerTest < ActionController::TestCase
  setup do
    @sequencer_tag = sequencer_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequencer_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequencer_tag" do
    assert_difference('SequencerTag.count') do
      post :create, sequencer_tag: { sequencer_id: @sequencer_tag.sequencer_id, str: @sequencer_tag.str }
    end

    assert_redirected_to sequencer_tag_path(assigns(:sequencer_tag))
  end

  test "should show sequencer_tag" do
    get :show, id: @sequencer_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequencer_tag
    assert_response :success
  end

  test "should update sequencer_tag" do
    patch :update, id: @sequencer_tag, sequencer_tag: { sequencer_id: @sequencer_tag.sequencer_id, str: @sequencer_tag.str }
    assert_redirected_to sequencer_tag_path(assigns(:sequencer_tag))
  end

  test "should destroy sequencer_tag" do
    assert_difference('SequencerTag.count', -1) do
      delete :destroy, id: @sequencer_tag
    end

    assert_redirected_to sequencer_tags_path
  end
end
