require 'test_helper'

class SoftwaresControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:softwares)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_software
    assert_difference('Software.count') do
      post :create, :software => { }
    end

    assert_redirected_to software_path(assigns(:software))
  end

  def test_should_show_software
    get :show, :id => softwares(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => softwares(:one).id
    assert_response :success
  end

  def test_should_update_software
    put :update, :id => softwares(:one).id, :software => { }
    assert_redirected_to software_path(assigns(:software))
  end

  def test_should_destroy_software
    assert_difference('Software.count', -1) do
      delete :destroy, :id => softwares(:one).id
    end

    assert_redirected_to softwares_path
  end
end
