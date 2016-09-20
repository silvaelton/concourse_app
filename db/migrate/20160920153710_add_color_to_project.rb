class AddColorToProject < ActiveRecord::Migration
  def change
    add_column :projects, :header_color, :string
  end
end
