class TiketsController < ApplicationController
  before_action :set_tiket, only: [:show, :edit, :update, :destroy]
  before_action :set_stations, only: [:new]

  def index
    @tikets = Tiket.all
  end

  def show
  end

  def new
    @tiket = Tiket.new(tiket_params)
  end

  def create
    @tiket  = current_user.tikets.new(tiket_params)
    if @tiket.save
      redirect_to @tiket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tiket.update(tiket_params)
      redirect_to @tiket
    else
      render :edit
    end
  end

  def destroy
    @tiket.destroy
    redirect_to tikets_path
  end

  private

  def set_tiket
    @tiket = Tiket.find(params[:id])
  end

  def tiket_params
    params.require(:tiket).permit(:number, :begin_station_id,
                                   :end_station_id, :user_id,
                                   :train_id, :name, :passport)
  end

  def set_stations
    @from = RailwayStation.find(params[:tiket][:begin_station_id])
    @to = RailwayStation.find(params[:tiket][:end_station_id])
  end
end
