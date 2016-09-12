class CreateParticipationFields < ActiveRecord::Migration
  def change
    create_table :participation_fields do |t|

      t.timestamps null: false
    end
  end
end
