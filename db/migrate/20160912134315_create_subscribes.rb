class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|

      t.integer :project_id, index: true
      t.integer :situation, default: 0
      t.boolean :subscribe_paid, default: false 
      t.integer :subscribe_id, index: true 

      t.string  :name
      t.string  :cpf 
      t.date    :born 
      t.integer :state_id, index: true 
      t.string  :city
      t.integer :gender
      t.string  :telephone
      t.string  :email
      t.string  :celphone 
      t.string  :address 
      t.string  :cep 
      t.string  :fantasy_name 
      t.string  :social_reason 
      t.string  :cnpj 
      
      t.string  :state_number 
      t.string  :local_subscribe

      t.string  :social_contract

      t.string  :password

      t.boolean :tecnical_responsible, default: false

      t.timestamps null: false
    end
  end
end
