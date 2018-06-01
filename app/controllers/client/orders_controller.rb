class Client::OrdersController < ApplicationController
  
  def create
    client_params = {
                    product_id: params[:product_id],
                    quantity: params[:quantity]
                    } 
    response = Unirest.post(
                            "http://localhost:3000/api/orders/",
                            parameters: client_params
                            )
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
