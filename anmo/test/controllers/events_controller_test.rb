require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @event = events(:test)
  end

  test "should redirect to main page when not logged in" do
    assert_no_difference 'Event.count' do
      post :create, event: { event_name: "TEST" }
    end
    assert_redirected_to login_url
  end

end
