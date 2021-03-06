class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(train_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to [:admin,@route], notice: 'Маршрут создан!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @route.update(train_params)
        format.html { redirect_to admin_routes_path, notice: 'Маршрут обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to admin_routes_path, notice: 'Маршрут удален!' }
    end
  end

  private

    def set_route
      @route = Route.find(params[:id])
    end

    def train_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end
end
