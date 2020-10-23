class AddForeignKeyToRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :park_id, :bigint
    add_foreign_key :rides, :parks
  end
end
