class RenameBookingsToTrips < ActiveRecord::Migration[6.0]
  def change
    rename_table :bookings, :trips
  end
end
