class AddPaidToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :paid, :boolean, default: false
    add_column :subscribes, :paid_observation, :text

  end
end
