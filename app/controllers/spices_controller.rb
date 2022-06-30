class SpicesController < ApplicationController
  def index
    render json: Spice.all
  end

  def create
    new_spice = Spice.create!(spice_create_params)
    render json: new_spice, status: 201
  end

  def update
    spice = Spice.find(params[:id])
    spice.update!(spice_update_params)
    render json: spice
  end

  def destroy
    Spice.find(params[:id]).destroy
    head :no_content
  end

  private

  def spice_create_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def spice_update_params
    params.permit(:rating)
  end
end
