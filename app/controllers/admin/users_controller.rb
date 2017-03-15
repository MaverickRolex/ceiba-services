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
  end

  def import_users_poller
  end

private

  def user_params
     params.require(:user).permit(:first_name, :password, :password_confirmation, :last_name, :email, :admin)
  end

  def user_update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      @user.update_without_password(user_params)
    else
      @user.update_attributes(user_params)
    end
  end

end
