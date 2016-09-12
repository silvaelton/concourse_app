class CreateSubscribeProfessionals < ActiveRecord::Migration
  def change
    create_table :subscribe_professionals do |t|

      t.timestamps null: false
    end
  end
end
