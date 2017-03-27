class UserImport < ApplicationRecord

  belongs_to :owned, class_name: "Company", foreign_key: :owner_id
  mount_uploader :file, ::UsersImportUploader

  COMPLETE = "complete"
  INCOMPLETE = "incomplete"
  STATUSES = [COMPLETE, INCOMPLETE]

end