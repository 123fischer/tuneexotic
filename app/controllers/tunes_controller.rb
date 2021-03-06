class TunesController < ApplicationController
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  def index
      if params[:query].present?
      sql_query = " \
        tunes.name ILIKE :query \
        OR tunes.description ILIKE :query \
      "
      @tunes = Tune.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      @requests = Request.all
    else
      @tunes = Tune.all
      @requests = Request.all
    end
  end

  def show
    @request = Request.new
  end

  def new
    @tune = Tune.new
  end

  def create
    @tune = Tune.new(tune_params)
    @tune.user = current_user
    if @tune.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tune.update(tune_params)
    redirect_to dashboard_path
  end

  def destroy
    @tune.destroy
    redirect_to dashboard_path
  end

  private

  def set_tune
    @tune = Tune.find(params[:id])
  end

  def tune_params
    params.require(:tune).permit(:name, :description, :url)
  end
end
