class BackgroundImporter
  include Sidekiq::Worker

  def perform(user_import_id)
    begin
      @import = UserImportManager.new(user_import_id)
      @import.import
    rescue Exception => exeption_msgs
      @user_import = UserImport.find(user_import_id)
      @user_import.update_attributes(status: UserImport.statuses["failed"])
    end
  end

end