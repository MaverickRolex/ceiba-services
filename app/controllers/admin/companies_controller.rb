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
    @company = Company.new(companies_params)
    binding.pry
    @company.save
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(companies_params)
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
     params.require(:company).permit(:name, :rfc, :description, primary_user_attributes: [:first_name, :last_name, :password, :password_confirmation, :email, :admin])
  end

end
