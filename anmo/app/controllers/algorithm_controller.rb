class AlgorithmController < ApplicationController
  before_action :logged_in_user

  def index
  @time = Time.new(2015)
  @events = current_user.events.all
  end
end
