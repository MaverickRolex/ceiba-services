class Client < ApplicationRecord

  belongs_to :primary_user, class_name: "User"

end