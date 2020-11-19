class AddStateToTents < ActiveRecord::Migration[6.0]
  def change
    add_column :tents, :state, :string
  end
end
