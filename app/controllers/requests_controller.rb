class RequestsController < ApplicationController
  before_action :set_tune, only: [:accepted, :rejected]
    
  def create
    @request = Request.new
    @request.user = current_user
    @tune = Tune.find(params[:tune_id])
    @request.tune = @tune
    if @request.save
      redirect_to tune_path(@tune)
    else
      render :new
    end
  end
    
  def accepted
    @request.status = "accepted"
    @request.save
  end

  def rejected
    @request.status = "rejected"
    @request.save
  end

  private
    
  def set_request
    @request = Request.find(params[:id])
  end
end
