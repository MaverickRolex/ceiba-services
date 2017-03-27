class UserImportManager
  attr_accessor :user_import

  def initialize(user_import_id)
    @user_import = UserImport.find(user_import_id)
  end

  # Import data from the file to database
  def import
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      @user = User.new(row)
      @user.save
    end
  end

  # Open import file and detect extension file
  def open_spreadsheet
    case File.extname(@user_import[:file])
      when ".csv" then ::Roo::Csv.new(@user_import.file.path, password: nil)
      when ".ods" then ::Roo::OpenOffice.new(@user_import.file.path, password: nil)
      when ".xls" then ::Roo::Excel.new(@user_import.file.path, password: nil)
      when ".xlsx" then ::Roo::Excelx.new(@user_import.file.path, password: nil)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end