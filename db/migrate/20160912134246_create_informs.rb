class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|

      t.integer :project_id, index: true
      t.string :title 
      t.text   :description
      t.date    :date 
      t.string  :label_link
      t.string  :link
      t.boolean :publish, default: true

      t.timestamps null: false
    end
  end
end
