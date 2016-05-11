require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "should display access counter only if greater than 5" do
    get :index
    get :index
    get :index
    get :index
    get :index
    get :index
    assert_match('Accessed 6 times', response.body )
  end

  test "should not display access counter if less than 5" do
    get :index
    get :index
    get :index
    refute_match('Accessed 3 times', response.body )
  end
end
