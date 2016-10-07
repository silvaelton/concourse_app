class AddTokenToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :token, :string
  end
end
