class AddProfessionalTypeToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :professional_type, :integer
    add_column :subscribes, :professional_document, :string
    add_column :subscribes, :paid_document, :string
  end
end
