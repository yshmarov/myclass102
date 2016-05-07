require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { address: @client.address, dob: @client.dob, email: @client.email, first_name: @client.first_name, last_name: @client.last_name, lead_source_id: @client.lead_source_id, middle_name: @client.middle_name, sex: @client.sex, tel1: @client.tel1, tel2: @client.tel2, tenant_id: @client.tenant_id }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { address: @client.address, dob: @client.dob, email: @client.email, first_name: @client.first_name, last_name: @client.last_name, lead_source_id: @client.lead_source_id, middle_name: @client.middle_name, sex: @client.sex, tel1: @client.tel1, tel2: @client.tel2, tenant_id: @client.tenant_id }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
