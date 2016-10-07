class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|

      t.string :title 
      t.text   :description
      t.string :date 
      t.string :link
      t.boolean :publish, default: true

      t.timestamps null: false
    end
  end
end
