class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      
      t.integer :project_id, index: true
      t.boolean :self_open,  default: false
      t.boolean :is_page,    default: true
      t.string  :href
      t.integer :page_id, index: true
      t.string  :label 
      t.boolean :publish, default: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
