class AddSeatsToCarriage < ActiveRecord::Migration
  def change
    add_column :carriages, :count_side_down, :integer
    add_column :carriages, :count_side_up, :integer
    add_column :carriages, :count_SB, :integer

  end
end
