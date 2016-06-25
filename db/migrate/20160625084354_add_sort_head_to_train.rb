class AddSortHeadToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :sort_from_head, :boolean, default: true
  end
end
