class AddForeignKeysToRideMechanics < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :ride_mechanics, :rides
    add_foreign_key :ride_mechanics, :mechanics
  end
end
