class BackgroundImporter
  include Sidekiq::Worker

  def perform(user_import_id)
    begin
      User.transaction do
        @import = UserImportManager.new(user_import_id)
        @import.import
      end
    rescue Exception => exeption_msgs
      binding.pry
      @user_import = UserImport.find(user_import_id)
      @user_import.update_attributes(status: UserImport.statuses["failed"])
    end
  end

end