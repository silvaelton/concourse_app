class CreateSubscribeObservations < ActiveRecord::Migration
  def change
    create_table :subscribe_observations do |t|
      
      t.integer :project_id, index: true
      t.integer :subscribe_id, index: true
      t.text    :content 

      t.timestamps null: false
    end
  end
end
