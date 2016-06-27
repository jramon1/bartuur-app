class RenameDistanceForUsers < ActiveRecord::Migration
  def change
    rename_column :users, :distance, :distance_radius
  end
end
