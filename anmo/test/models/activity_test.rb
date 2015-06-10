require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @activity = @user.activities.build(activity_name: "[test activity name]")
  end

  test "should be valid" do
    assert @activity.valid?
  end

  test "user id should be present" do
    @activity.user_id = nil
    assert_not @activity.valid?
  end

  test "activity_name should be present" do
    @activity.activity_name = nil
    assert_not @activity.valid?
  end

end
