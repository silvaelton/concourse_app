class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|

      t.string  :name 
      t.integer :max_mb, default: 0
      t.integer :participation_type, default: 0 #document, project

      t.timestamps null: false
    end
  end
end
