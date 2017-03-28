class Admin::CompaniesController < ApplicationController

  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @company = Company.new
    @company.build_primary_user
  end

  def create
    @company = Company.new(companies_params[])
    @company.save
  end

  def update
    @user = User.find(companies_params[:primary_user_attributes][:id])
    @company = Company.find(params[:id])
    company_update
  end

  def edit
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy if current_user.admin?
  end

  private

  def companies_params
     params.
       require(:company).
       permit(
         :name,
         :rfc,
         :description,
         primary_user_attributes: [
           :first_name,
           :last_name,
           :password,
           :password_confirmation,
           :email,
           :admin,
           :id
         ]
       )
  end

  def company_update
    if params[:company][:primary_user_attributes][:password].blank? && params[:company][:primary_user_attributes][:password_confirmation].blank?
      @user.update_without_password(companies_params[:primary_user_attributes])
      @company.update(companies_params.except(:primary_user_attributes))
    else
      @user.update_attributes(companies_params[:primary_user_attributes])
      @company.update(companies_params.except(:primary_user_attributes))
    end
  end

end
