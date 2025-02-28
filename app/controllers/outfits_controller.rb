class OutfitsController < ApplicationController
    before_action :authenticate_user!

  def show
    @outfit = Outfit.find(params[:id])
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user # Associate the user
    if @outfit.save
      redirect_to edit_outfit_path(@outfit), notice: "Outfit created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path, notice: "Outfit deleted successfully."
  end

  def edit
    @outfit = Outfit.find(params[:id])
    @outfit.user = current_user
    @product_top = OutfitProduct.new
    @product_bottom = OutfitProduct.new
    @product_shoes = OutfitProduct.new
  end

  def index
    @outfits = current_user.outfits
    @closet_items = current_user.closet_items.includes(:product)
  end

  private

  # Only allow the photo parameter in the outfit_params
  def outfit_params
    params.require(:outfit).permit(:photo, :season, :budget, :gender, :style)
  end

end
