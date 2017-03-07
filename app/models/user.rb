class User < ApplicationRecord

  has_many :clients, foreign_key: :primary_user_id
  has_many :user_service_groups
  has_many :service_groups, through: :user_service_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    first_name + " " + last_name
  end

end
