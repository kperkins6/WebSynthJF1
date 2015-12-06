require 'test_helper'

class SynthControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
