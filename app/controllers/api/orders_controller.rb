class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    calculated_subtotal = params[:quantity].to_i * Product.find(params[:product_id].to_i).price
    calculated_tax = params[:quantity].to_i * Product.find(params[:product_id].to_i).tax
    calculated_total = params[:quantity].to_i * Product.find(params[:product_id].to_i).total

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save
    render "show.json.jbuilder"
  end
end
