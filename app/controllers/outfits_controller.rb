class OutfitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @outfits = current_user.outfits
    @closet_items = current_user.closet_items.includes(:product)
  end

  def show
    @outfit = Outfit.find(params[:id])
      # Ensure that the related products (OutfitProduct) are loaded
    @outfit_products = @outfit.outfit_products.includes(:product)
  end

  def new
    @outfit = Outfit.new
    # Fetch products by type
    @top_products = Product.where(product_type: 'top')
    @bottom_products = Product.where(product_type: 'bottom')
    @shoe_products = Product.where(product_type: 'shoes')
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user # Associate the user
    if @outfit.save
      @outfit.generate_embedding
      redirect_to edit_outfit_path(@outfit), notice: "Outfit created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new_from_products
    @outfit = Outfit.new
    @top_products = Product.where(product_type: 'top')
    @bottom_products = Product.where(product_type: 'bottom')
    @shoe_products = Product.where(product_type: 'shoes')
  end

  def create_from_products
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user  # Associate the user
    # Create outfit_products for the selected products
    top_product = Product.find(params[:outfit][:top]) if params[:outfit][:top].present?
    bottom_product = Product.find(params[:outfit][:bottom]) if params[:outfit][:bottom].present?
    shoe_product = Product.find(params[:outfit][:shoe]) if params[:outfit][:shoe].present?

    if top_product.nil? || bottom_product.nil? || shoe_product.nil?
      flash[:error] = "Please select valid top, bottom, and shoe products."
      render :new_from_products, status: :unprocessable_entity
      return
    end

    if @outfit.save
      OutfitProduct.create!(outfit: @outfit, product: top_product) if top_product
      OutfitProduct.create!(outfit: @outfit, product: bottom_product) if bottom_product
      OutfitProduct.create!(outfit: @outfit, product: shoe_product) if shoe_product
      redirect_to @outfit, notice: 'Outfit created successfully!'
    else
      render :new_from_products, status: :unprocessable_entity
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path, status: :see_other
  end


  def edit
    @outfit = Outfit.find(params[:id])
    @outfit_product = OutfitProduct.new
    # Fetch products by type
    @top_products = Product.where(product_type: 'top')
    tops =  @outfit.nearest_tops
    @top_choice1 = tops.first
    @top_choice2 = tops.second
    @bottom_products = Product.where(product_type: 'bottom')
    bottoms = @outfit.nearest_bottoms
    @bottom_choice1 = bottoms.first
    @bottom_choice2 = bottoms.second
    @shoe_products = Product.where(product_type: 'shoes')
    shoes = @outfit.nearest_shoes
    @shoe_choice1 = shoes.first
    @shoe_choice2 = shoes.second
    # @description = @outfit.generate_description
  end

  def update

    @outfit = Outfit.find(params[:id])
    @top_product = Product.find(params[:top])
    @outfit_product_top = OutfitProduct.create(outfit: @outfit, product: @top_product)
    @bottom_product = Product.find(params[:bottom])
    @outfit_product_bottom = OutfitProduct.create(outfit: @outfit, product: @bottom_product)
    @shoe_product = Product.find(params[:shoe])
    @outfit_product_shoe = OutfitProduct.create(outfit: @outfit, product: @shoe_product)

    if @outfit.update(outfit_params)
      redirect_to outfits_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Only allow the photo parameter in the outfit_params
  def outfit_params
    params.require(:outfit).permit(:photo, :name, :budget, :season, :style, :gender)
  end

  def filtered_products(product_type)
    products = Product.where(product_type: product_type)
    # Apply filter if applicable
    if params[:season].present?
      products = products.where("season LIKE ?", "%#{params[:season]}%")
    end
    if params[:style].present?
      products = products.where(style: params[:style])
    end
    if params[:gender].present?
      products = products.where(gender: params[:gender])
    end

    products
  end
end
