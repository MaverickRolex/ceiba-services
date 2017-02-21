class UserServiceGroup < ApplicationRecord

  belongs_to :service_group
  belongs_to :user
  
end
