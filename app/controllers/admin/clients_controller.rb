class Admin::ClientsController < ApplicationController

  def index
    @clients = Client.all
    @clients = @clients.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update_attributes(client_params)
  end


  def destroy
    @client = Client.find(params[:id])
    @client.destroy if current_user.admin?
  end

private

  def client_params
     params.require(:client).permit(:name, :description)
  end

end
