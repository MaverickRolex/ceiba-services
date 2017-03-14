class Admin::ServiceGroupsController < ApplicationController

  def index
    @q = ServiceGroup.ransack(params[:q])
    @service_groups = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @service_group = ServiceGroup.new
  end

  def create
    @service_group = ServiceGroup.new(service_groups_params)
    @service_group.save
  end

  def edit
    @service_group = ServiceGroup.find(params[:id])
  end

  def update
    @service_group = ServiceGroup.find(params[:id])
    @service_group.update_attributes(service_groups_params)
  end


  def destroy
    @service_group = ServiceGroup.find(params[:id])
    @service_group.destroy if current_user.admin?
  end

private

  def service_groups_params
    params.require(:service_group).permit(:name, :description)
  end

end
