class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      
      t.integer :user_id, index: true
      t.text    :description

      t.timestamps null: false
    end
  end
end
