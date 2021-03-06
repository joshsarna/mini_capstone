class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :destroy, :update]

  def index
    @products = Product.all # for axios request
    # user_input = params[:search]
    # search_type = params[:search_type]
    # genre = params[:genre]
    # sort_by = params[:sort_by] || "id"
    # if params[:genre] != ""
    #   genre = Genre.find_by(name: params[:genre])
    #   @products = genre.products
    # else
    #   if user_input
    #     @products = Product.where("#{search_type} LIKE ?", "%#{user_input}%").order("#{sort_by}")
    #   else
    #     @products = Product.all.order("#{sort_by}")
    #   end
    # end
    render "index.json.jbuilder"
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
      supplier_id: params[:input_supplier_id]
    )
    if @product.save
      @image = Picture.new(
        url: params[:input_image_url],
        product_id: @product.id
      )
      @image.save
      render "show.json.jbuilder"
    else # sad path
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity 
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "You deleted product #{params[:id]}"}
  end

  def update
    @product = Product.find_by(id: params[:id])

    # answer = "y"
    # while answer == "y" do
    #   p "What parameter would you like to update?"
    #   update_parameter = gets.chomp
    #   p "What would you like to change the #{update_parameter} to?"

    @product.update(
      name: params[:input_name] || @product.name,
      author: params[:input_author] || @product.author,
      price: params[:input_price] || @product.price,
      description: params[:input_description] || @product.description,
      format: params[:input_format] || @product.format,
      condition: params[:input_condition] || @product.condition,
      image_url: params[:input_image_url] || @product.image_url,
      supplier_id: params[:input_supplier_id] || @product.supplier_id
    )

      # if update_parameter == "name"
      #   @product.update(name: gets.chomp)
      # elsif update_parameter == "author"
      #   @product.update(author: gets.chomp)
      # elsif update_parameter == "price"
      #   @product.update(price: gets.chomp.to_d)
      # elsif update_parameter == "description"
      #   @product.update(description: gets.chomp)
      # elsif update_parameter == "format"
      #   @product.update(format: gets.chomp)
      # elsif update_parameter == "condition"
      #   @product.update(condition: gets.chomp)
      # elsif update_parameter == "image_url"
      #   @product.update(image_url: gets.chomp)
      # end

      # p "Would you like to update another parameter? [y/n]"
      # answer = gets.chomp

    
    @product.save
    render "show.json.jbuilder"
  end
end