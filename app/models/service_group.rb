class ServiceGroup < ApplicationRecord

  has_many :user_service_groups
  has_many :users, through: :user_service_groups

end
