class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.string :industry
      t.string :service_interest
      t.text :message
      t.string :status, default: "new", null: false

      t.timestamps
    end
  end
end
