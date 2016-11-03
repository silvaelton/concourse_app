class CreateSubscribeParticipations < ActiveRecord::Migration
  def change
    create_table :subscribe_participations do |t|

      t.integer :subscribe_id, index: true 
      t.integer :participation_id, index: true 
      t.string  :participation_file
      
      t.timestamps null: false
    end
  end
end
