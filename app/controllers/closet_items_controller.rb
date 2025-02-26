class ClosetItemsController < ApplicationController

  def create
    @closet_item = current_user.closet_items.build(closet_item_params)
    if @closet_item.save
      redirect_to @closet_item, notice: 'closet_item was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @closet_item.destroy
    redirect_to closet_items_url, notice: 'closet_item was successfully destroyed.'
  end
end
