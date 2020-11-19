class AddAddressToTents < ActiveRecord::Migration[6.0]
  def change
    add_column :tents, :address, :string
  end
end
