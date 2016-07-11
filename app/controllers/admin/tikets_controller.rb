class Admin::TiketsController < Admin::BaseController
  before_action :set_tiket, only: [:show, :edit, :update, :destroy, :set_stations]
  before_action :set_stations, only: [:edit]

  def index
    @tikets = Tiket.all
  end

  def show
  end

  def edit
  end

  def update
    if @tiket.update(tiket_params)
      redirect_to [:admin,@tiket]
    else
      render :edit
    end
  end

  def destroy
    @tiket.destroy
    redirect_to [:admin,tikets_path]
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
    @from = RailwayStation.find(@tiket.begin_station_id)
    @to = RailwayStation.find(@tiket.end_station_id)
  end
end
