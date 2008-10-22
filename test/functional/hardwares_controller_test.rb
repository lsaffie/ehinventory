require 'test_helper'

class HardwaresControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hardwares)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_hardware
    assert_difference('Hardware.count') do
      post :create, :hardware => { }
    end

    assert_redirected_to hardware_path(assigns(:hardware))
  end

  def test_should_show_hardware
    get :show, :id => hardwares(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hardwares(:one).id
    assert_response :success
  end

  def test_should_update_hardware
    put :update, :id => hardwares(:one).id, :hardware => { }
    assert_redirected_to hardware_path(assigns(:hardware))
  end

  def test_should_destroy_hardware
    assert_difference('Hardware.count', -1) do
      delete :destroy, :id => hardwares(:one).id
    end

    assert_redirected_to hardwares_path
  end
end
