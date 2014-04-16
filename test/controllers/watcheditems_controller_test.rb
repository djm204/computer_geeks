# encoding: UTF-8
require 'test_helper'
#
class WatcheditemsControllerTest < ActionController::TestCase
  setup do
    @watcheditem = watcheditems(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:watcheditems)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create watcheditem' do
    assert_difference('Watcheditem.count') do
      post :create, watcheditem: {}
    end

    assert_redirected_to watcheditem_path(assigns(:watcheditem))
  end

  test 'should show watcheditem' do
    get :show, id: @watcheditem
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @watcheditem
    assert_response :success
  end

  test 'should update watcheditem' do
    patch :update, id: @watcheditem, watcheditem: {}
    assert_redirected_to watcheditem_path(assigns(:watcheditem))
  end

  test 'should destroy watcheditem' do
    assert_difference('Watcheditem.count', -1) do
      delete :destroy, id: @watcheditem
    end

    assert_redirected_to watcheditems_path
  end
end
