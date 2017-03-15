class CreateSubscribeCustomParticipations < ActiveRecord::Migration
  def change
    create_table :subscribe_custom_participations do |t|

      t.integer :subscribe_id
      t.string  :archive_file_one
      t.string  :archive_file_two
      t.string  :archive_file_three
      t.string  :archive_file_four
      
      t.timestamps null: false
    end
  end
end
