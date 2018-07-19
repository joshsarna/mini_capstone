class Api::CartedProductsController < ApplicationController
  def create
    CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    render "show.json.jbuilder"
  end
end
