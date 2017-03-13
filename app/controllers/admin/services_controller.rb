class Admin::ServicesController < ApplicationController

  def index
    @q = Service.ransack(params[:q])
    @services = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.save
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update_attributes(service_params)
  end


  def destroy
    @service = Service.find(params[:id])
    @service.destroy if current_user.admin?
  end

private

  def service_params
     params.require(:service).permit(:title, :description)
  end

end

