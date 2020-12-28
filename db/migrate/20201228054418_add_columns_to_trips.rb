class AddColumnsToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :arrival_date, :date
    add_column :trips, :departure_date, :date
    remove_foreign_key :trips, column: :tent_id
    add_reference :trips, :site, foreign_key: true
    remove_column :trips, :checkin_date, :date
    remove_column :trips, :checkout_date, :date
  end
end
