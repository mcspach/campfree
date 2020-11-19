class RemoveLocationFromTents < ActiveRecord::Migration[6.0]
  def change
    remove_column :tents, :location, :string
  end
end
