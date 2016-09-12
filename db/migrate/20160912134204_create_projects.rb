class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string  :title
      t.text    :description
      t.integer :main_page_id
      t.date    :start
      t.date    :end
      t.date    :consult_start
      t.date    :consult_end
      t.text    :consult_text
      t.boolean :consult_publish, default: false
      
      t.date    :subscribe_start
      t.date    :subscribe_end
      t.boolean :subscribe_publish, default: false
      
      t.date    :participation_start
      t.date    :participation_end
      t.boolean :participation_publish, default: false

      t.date    :result_date
      t.time    :result_hour
      t.boolean :result_publish, default: false
      t.string  :result_document

      t.boolean :page_projects_allow, default:  false
      t.string  :slug
      t.integer :situation, default: 0

      t.string  :banner
      t.string  :avatar 

      t.timestamps null: false
    end

    add_index :projects, :slug, unique: true
  end
end
