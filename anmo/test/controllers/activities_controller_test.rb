require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase

  def setup
    @activity = activities(:test)
  end

  test "should redirect to main page when not logged in" do
    assert_no_difference 'Activity.count' do
      post :create, activity: { activity_name: "TEST" }
    end
    assert_redirected_to login_url
  end
  #   assert true
  # end
end
