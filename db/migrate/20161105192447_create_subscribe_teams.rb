class CreateSubscribeTeams < ActiveRecord::Migration
  def change
    create_table :subscribe_teams do |t|

      t.integer :project_id, index: true
      t.integer :subscribe_id, index: true 
      t.integer :activity
      t.string  :name 
      t.integer :professional_type, default: 0
      t.string  :number_registry
      t.integer :team_type, default: 0
      t.string  :archive_path

      t.timestamps null: false
    end
  end
end
