class AddCoordinatesToTents < ActiveRecord::Migration[6.0]
  def change
    add_column :tents, :latitude, :float
    add_column :tents, :longitude, :float
  end
end
