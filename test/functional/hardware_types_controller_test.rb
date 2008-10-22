require 'test_helper'

class HardwareTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hardware_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_hardware_type
    assert_difference('HardwareType.count') do
      post :create, :hardware_type => { }
    end

    assert_redirected_to hardware_type_path(assigns(:hardware_type))
  end

  def test_should_show_hardware_type
    get :show, :id => hardware_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hardware_types(:one).id
    assert_response :success
  end

  def test_should_update_hardware_type
    put :update, :id => hardware_types(:one).id, :hardware_type => { }
    assert_redirected_to hardware_type_path(assigns(:hardware_type))
  end

  def test_should_destroy_hardware_type
    assert_difference('HardwareType.count', -1) do
      delete :destroy, :id => hardware_types(:one).id
    end

    assert_redirected_to hardware_types_path
  end
end
