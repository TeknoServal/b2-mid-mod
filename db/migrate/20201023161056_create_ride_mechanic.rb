class CreateRideMechanic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rides, :mechanics, table_name: :ride_mechanics do |t|

    end
  end
end
