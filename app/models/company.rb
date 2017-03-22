 class Company < ApplicationRecord

  has_many :owned_users, class_name: "User", foreign_key: :owner_id
  validates :name, :description, presence: true
  has_one :primary_user
  belongs_to :prymary_user, foreign_key: :primary_user_id, class_name: "User"

end
