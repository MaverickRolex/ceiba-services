class CreateUserServiceGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_service_groups do |t|
      t.integer :user_id
      t.integer :service_group_id
      t.timestamps
    end
  end
end
