class TunesController < ApplicationController
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  def index
    @tunes = Tune.all
  end

  def show
  end

  def new
    @tune = Tune.new
  end

  def create
    @tune = Tune.new(tune_params)
    @tune.user = current_user
    if @tune.save
      redirect_to tune_path(@tune)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tune.update(name: params[:name], description: params[:description], url: params[:url])
    redirect_to tune_path(@tune)
  end

  def destroy
    @tune.destroy
    redirect_to tunes_path
  end

  private

  def set_tune
    @tune = Tune.find(params[:id])
  end

  def tune_params
    params.require(:tune).permit(:name, :description, :url)
  end
end
