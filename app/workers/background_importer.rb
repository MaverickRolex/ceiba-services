class BackgroundImporter
  include Sidekiq::Worker

  def perform(user_import_id)
    @import = UserImportManager.new(user_import_id) # UserImport.last.id
    @import.import
  end

  def redis
    @redis ||= Redis.new
  end
end