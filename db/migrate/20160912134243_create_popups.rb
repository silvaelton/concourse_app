class CreatePopups < ActiveRecord::Migration
  def change
    create_table :popups do |t|

      t.timestamps null: false
    end
  end
end
