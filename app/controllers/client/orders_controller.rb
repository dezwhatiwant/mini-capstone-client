class Client::OrdersController < ApplicationController
  
  def create
    response = Unirest.post("http://localhost:3000/api/orders/")
    @order = response.body
    flash[:success] = "Successfully Created Order"
    redirect_to "/client/orders/#{@order['id']}"
  end

  def show
    respose = Unirest.get("http://localhost:3000/api/orders/#{params[:id]}")
    @order = respose.body
    render 'show.html.erb'
  end
end
