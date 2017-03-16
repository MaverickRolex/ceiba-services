class Service < ApplicationRecord

  belongs_to :service_group

  validates :title, :description, presence: true
  
end
