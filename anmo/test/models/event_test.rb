require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @activity = @user.activities.build(activity_name: "[test activity name]") 
    @event = @activity.events.build(event_name: "[test event name]", :user=>@user)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user id should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end

  test "event_name should be present" do
    @event.event_name = nil
    assert_not @event.valid?
  end

end
