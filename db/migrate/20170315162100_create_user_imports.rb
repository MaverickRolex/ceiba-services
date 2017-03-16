class CreateUserImports < ActiveRecord::Migration[5.0]
  def change
    create_table :user_imports do |t|
      t.string :file
      t.integer :owner_id
      t.integer :status
      t.timestamps
    end
  end
end
