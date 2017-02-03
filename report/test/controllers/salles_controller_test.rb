require 'test_helper'

class SallesControllerTest < ActionController::TestCase
  setup do
    @salle = salles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create salle" do
    text_file = fixture_file_upload('files/dados.txt','text/plain')
    post :create, salle: { file: text_file }

    assert_response :success
  end

  test "should show salles" do
    get :list_report
    assert_response :success
  end

end
