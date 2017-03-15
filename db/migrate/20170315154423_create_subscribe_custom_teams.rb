class CreateSubscribeCustomTeams < ActiveRecord::Migration
  def change
    create_table :subscribe_custom_teams do |t|

      t.integer :subscribe_custom_participation_id 
      t.string  :name 
      t.string  :cpf
      t.integer :job

      t.timestamps null: false
    end
  end
end
