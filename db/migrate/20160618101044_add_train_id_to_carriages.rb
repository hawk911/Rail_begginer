class AddTrainIdToCarriages < ActiveRecord::Migration
  def change
    add_belongs_to :carriages, :train
  end
end
