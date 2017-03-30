class Admin::UsersController < Admin::BaseController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if current_user.admin? && !(current_user == @user)
  end

  def import_users_new
  end

  def import_users_create
    @user_import = UserImport.new(
      file: import_user_params[:import_users],
      status: UserImport.statuses["incomplete"]
    )
    @user_import.save
    BackgroundImporter.perform_async(@user_import.id)
  end

  def import_users_poller
    @user_import = UserImport.find(params[:id])
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :admin)
  end

  def user_update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      @user.update_without_password(user_params)
    else
      @user.update_attributes(user_params)
    end
  end

  def import_user_params
    params.require(:import_file).permit(:import_users)
  end

end
