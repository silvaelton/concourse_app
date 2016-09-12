class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.string  :name
      t.string  :email
      t.string  :password
      t.integer :privilege, default: 0
      t.boolean :status, default: true

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
