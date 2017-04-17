class AddSpecialToSubscribeCustomParticipation < ActiveRecord::Migration
  def change
    add_column :subscribe_custom_participations, :special, :boolean, default: false
  end
end
