class AddCarriageTypeIdToCarriages < ActiveRecord::Migration
  def change
    add_belongs_to :carriages, :carriage_type
  end
end
