class CreatePopups < ActiveRecord::Migration
  def change
    create_table :popups do |t|


      t.string  :title
      t.text    :content 
      t.boolean :publish, default: true
      t.string  :link 
      
      t.timestamps null: false
    end
  end
end
