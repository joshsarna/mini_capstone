class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create

    p "What is the title of the book you would like to add to the store?"
    input_name = gets.chomp
    p "What is the author's name?"
    input_author = gets.chomp
    p "How much does the book cost?"
    input_price = gets.chomp.to_d
    p "What is the description?"
    input_description = gets.chomp
    p "What format is the book?"
    input_format = gets.chomp
    p "What condition is the book?"
    input_condition = gets.chomp
    p "What is the image url?"
    input_image_url = gets.chomp

    @product = Product.new(
      name: input_name,
      price: input_price,
      description: input_description,
      author: input_author,
      format: input_format,
      condition: input_condition,
      image_url: input_image_url
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