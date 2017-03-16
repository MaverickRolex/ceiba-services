class Company < ApplicationRecord

  has_many :owned_users, class_name: "User", foreign_key: :owner_id
  has_many :user_imports, class_name: "UserImport", foreign_key: :owner_id

end
