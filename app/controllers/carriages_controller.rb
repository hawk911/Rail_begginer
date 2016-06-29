class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)

    respond_to do |format|
      if @carriage.save
        format.html { redirect_to @carriage.becomes(Carriage), notice: 'Вагон создан!' }
      else
        format.html { render :new }
        end
    end
  end

  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to @carriage, notice: 'Вагон обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to carriages_url, notice: 'Вагон удален!' }
    end
  end

  private

    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:name, :count_up, :count_down, :train_id,
        :count_side_up,:count_side_down,:carriage_type_id, :type)
    end

end
