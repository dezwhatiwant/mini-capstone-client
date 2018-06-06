class Client::ImagesController < ApplicationController

def index
  repsonse = Unirest.get("http://localhost:3000/api/images")

  @images = response.body
  render 'index.html.erb' 
end


end
