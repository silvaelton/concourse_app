class AddTecnicalObservationToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :tecnical_observation, :string
  end
end
