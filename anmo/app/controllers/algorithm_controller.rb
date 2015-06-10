class AlgorithmController < ApplicationController
  before_action :logged_in_user

  def index
    @events = current_user.events.all
    @now = Time.now.change(hour: 0, min: 0, sec:0)
  
    @events_output = {} 
    (9..18).step(1) do |n|
      @events.each do |e|
        if e.start_time.hour == n
          @events_output[@now.change(hour: n)] = e
          break 
        elsif e.end_time.hour == n
          @events_output[@now.change(hour: n-1)] = e
          next 
        else
          @events_output[@now.change(hour: n)] = ""
        end
      end
    end
  
  end
end
