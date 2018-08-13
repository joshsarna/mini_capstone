class Api::OrdersController < ApplicationController
  # before_action :user_authenticate, only: [:show, :create]

  def index
    @orders = Order.where(user_id: current_user.id)
    render "index.json.jbuilder"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = []
    total_tax = []
    cart_total = []
    @carted_products.each do |carted_product|
      subtotal << carted_product.quantity * carted_product.product.price
      total_tax << carted_product.quantity * carted_product.product.tax
      cart_total << carted_product.quantity * carted_product.product.total
    end
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal.reduce(:+),
      tax: total_tax.reduce(:+),
      total: cart_total.reduce(:+)
    )
    @order.save
    @carted_products.each do |product|
      product.order_id = @order.id
      product.status = "purchased"
      product.save
    end

    # calculated_subtotal = params[:quantity].to_i * Product.find(params[:product_id].to_i).price
    # calculated_tax = params[:quantity].to_i * Product.find(params[:product_id].to_i).tax
    # calculated_total = params[:quantity].to_i * Product.find(params[:product_id].to_i).total

    # @order = Order.new(
    #   user_id: current_user.id,
    #   product_id: params[:product_id],
    #   quantity: params[:quantity],
    #   subtotal: calculated_subtotal,
    #   tax: calculated_tax,
    #   total: calculated_total
    # )
    # @order.save
    render "show.json.jbuilder"
  end
end
