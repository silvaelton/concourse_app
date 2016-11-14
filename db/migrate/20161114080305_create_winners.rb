class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|

      t.integer :subscribe_participation_id
      t.integer :winner_type
      t.integer :project_id
      
      t.timestamps null: false

    end
  end
end
