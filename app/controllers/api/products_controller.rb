class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "all_products_view.json.jbuilder"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      author: params[:input_author],
      format: params[:input_format],
      condition: params[:input_condition],
      image_url: params[:input_image_url]
    )
    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "You deleted product #{params[:id]}"}
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.update(
      name: params[:input_name] || @product.name,
      price: params[:input_price] || @product.price,
      description: params[:input_description] || @product.description,
      format: params[:input_format] || @product.format,
      condition: params[:input_condition] || @product.condition,
      image_url: params[:input_image_url] || @product.image_url
    )
    @product.save
    render "show.json.jbuilder"
  end
end
