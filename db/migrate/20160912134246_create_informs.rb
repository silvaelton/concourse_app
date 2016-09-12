class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|

      t.timestamps null: false
    end
  end
end
