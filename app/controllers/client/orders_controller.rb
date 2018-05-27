class Client::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    respose = Unirest.get("http://localhost:3000/api/orders/#{order_id}")
    @order = respose.body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    order_params = {
                    product_id: params[:product_id],
                    quantity: params[:quantity]
                    } 
    response = Unirest.post(
                            "http://localhost:3000/api/orders/",
                            parameters: product_params
                            )
    product = response.body
    flash[:success] = "Successfully Created Product"
    redirect_to "/client/products/#{ product["id"] }"
  end
end
