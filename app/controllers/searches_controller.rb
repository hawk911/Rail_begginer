class SearchesController < ApplicationController
  def new
    @trains = Search.get_trains(params[:from], params[:to])
    render :show
  end

  def show
  end
end
