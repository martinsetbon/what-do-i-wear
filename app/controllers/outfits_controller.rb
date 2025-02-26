class OutfitsController < ApplicationController
  before_action :authenticate_user!

  # GET /outfits
  def index
    @outfits = current_user.outfits
    @closet_items = current_user.closet_items.includes(:product)
  end


end
