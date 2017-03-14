class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :rfc
      t.text :description
      t.integer :primary_user_id
      t.timestamps
    end
  end
end
