class RenameTentsToSites < ActiveRecord::Migration[6.0]
  def change
    rename_table :tents, :sites
  end
end
