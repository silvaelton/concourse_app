class CreateMeans < ActiveRecord::Migration
  def change
    create_table :means do |t|

      t.integer :subscribe_id
      t.integer :project_id
      t.text    :content
      
      t.timestamps null: false
    end
  end
end
