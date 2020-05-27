class PagesController < ApplicationController
  def home
    @navbar_visible = false
  end

  def dashboard
    @requests = Request.all
    @requests = @requests.select { |request| request.status == "pending" }
    @my_requests = []
    @requests.each do |request|
      if request.tune.user == current_user
        @my_requests << request
      end
    end
    @my_requests
  end
end
