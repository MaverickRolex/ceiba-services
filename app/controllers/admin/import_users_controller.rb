class Admin::ImportUsersController < ApplicationController

  def new
  end

  def create
    @user_import = UserImport.new(
      file: import_user_params[:import_users],
      status: UserImport.statuses["incomplete"]
    )
    @user_import.save
    BackgroundImporter.perform_async(@user_import.id)
  end

  def poller
    @user_import = UserImport.find(params[:id])
  end

  private

  def import_user_params
    params.require(:import_file).permit(:import_users)
  end

end
