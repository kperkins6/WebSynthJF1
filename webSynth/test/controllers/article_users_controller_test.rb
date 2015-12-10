require 'test_helper'

class ArticleUsersControllerTest < ActionController::TestCase
  setup do
    @article_user = article_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_user" do
    assert_difference('ArticleUser.count') do
      post :create, article_user: { article_id: @article_user.article_id, user_id: @article_user.user_id }
    end

    assert_redirected_to article_user_path(assigns(:article_user))
  end

  test "should show article_user" do
    get :show, id: @article_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_user
    assert_response :success
  end

  test "should update article_user" do
    patch :update, id: @article_user, article_user: { article_id: @article_user.article_id, user_id: @article_user.user_id }
    assert_redirected_to article_user_path(assigns(:article_user))
  end

  test "should destroy article_user" do
    assert_difference('ArticleUser.count', -1) do
      delete :destroy, id: @article_user
    end

    assert_redirected_to article_users_path
  end
end
