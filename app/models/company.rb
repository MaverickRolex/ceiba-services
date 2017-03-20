class Company < ApplicationRecord

  has_many :owned_users, class_name: "User", foreign_key: :owner_id

  validates :name, :description, presence: true

end
