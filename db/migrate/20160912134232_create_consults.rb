class CreateConsults < ActiveRecord::Migration
  def change
    create_table :consults do |t|
      
      t.integer :project_id, index: true
      t.text    :content
      t.integer :situation, default: 0

      t.timestamps null: false
    end
  end
end
