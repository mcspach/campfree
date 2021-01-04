class RemoveTentidFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_reference :trips, :tent, null: false
  end
end
