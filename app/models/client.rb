class Client < ApplicationRecord

  belongs_to :primary_user, class_name: "User"

  validates :name, :description, presence: true
  
end
