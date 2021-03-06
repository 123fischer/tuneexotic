class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject, :destroy]

  def create
    @request = Request.new
    @request.user = current_user
    @tune = Tune.find(params[:tune_id])
    @request.tune = @tune

    if @request.save
      redirect_to tunes_path
    else
      render :new
    end
  end

  def accept
    @request.status = "accepted"
    @request.save
    redirect_to dashboard_path
  end

  def reject
    @request.status = "rejected"
    @request.save
    redirect_to dashboard_path
  end

  def destroy
    redirect_to tunes_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end
end
