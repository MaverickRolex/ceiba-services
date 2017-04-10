 class Company < ApplicationRecord

  has_many :owned_users, class_name: "User", foreign_key: :owner_id
  has_many :user_imports, class_name: "UserImport", foreign_key: :owner_id
  validates :name, :description, presence: true
  belongs_to :primary_user, foreign_key: :primary_user_id, class_name: "User"

  accepts_nested_attributes_for :primary_user
end
