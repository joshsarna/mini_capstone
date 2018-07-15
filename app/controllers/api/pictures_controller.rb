class Api::PicturesController < ApplicationController
  def create
    @image = Picture.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    @image.save
    render "show.json.jbuilder"
  end

  def destroy
    @image = Picture.find_by(id: params[:id])
    @image.destroy
    render json: {message: "You deleted image #{params[:id]}"}
  end
end
