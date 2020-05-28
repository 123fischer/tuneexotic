class PagesController < ApplicationController
  def home
    @navbar_visible = false
  end

  def dashboard
    @requests = user_requests
    @tunes = user_tunes
  end

  private

  def user_requests
    @requests = Request.all
    @requests = @requests.select { |request| request.tune.user == current_user }
    @requests = @requests.select { |request| request.status == "pending" }
  end

  def user_tunes
    @tunes = Tune.all
    @tunes = @tunes.select { |tune| tune.user == current_user }
  end
end
