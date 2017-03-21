class Admin::InventoriesController < ApplicationController

  def index
    @q = Inventory.ransack(params[:q])
    @inventories = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.save
  end

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update_attributes(inventory_params)
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy if current_user.admin?
  end

  private

  def inventory_params
     params.require(:inventory).permit(:inventory_id, :quantity)
  end

end
