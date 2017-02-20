class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.integer :service_group_id
      t.timestamps
    end
  end
end
