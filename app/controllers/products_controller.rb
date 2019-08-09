class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show]

  def index
  end

  def show
    @product = Product.includes(:user,:big_category,:middle_category,:small_category,:brand,:delivary_day,:delivary_fee,:delivary_way,:shipping_origin,:status,:images).find(params[:id])
    @user_other_products = Product.where('(user_id = ?) and (id != ?)', @product.user_id, @product.id).order("created_at DESC").limit(6)
    @other_products = Product.where('(brand_id = ?) and (small_category_id = ?) and (id != ?)', @product.brand_id, @product.small_category_id, @product.id).order("created_at DESC").limit(6)
  end

  def edit
  end
  

  def new
    @big_category = BigCategory.all
    @middle_category = MiddleCategory.all
    @small_category = SmallCategory.all
    @brand = Brand.all
    @delivary_day = DelivaryDay.all
    @delivary_fee = DelivaryFee.all
    @delivary_way = DelivaryWay.all
    @shipping_origin = ShippingOrigin.all
    @status = Status.all

    @product = Product.new
    @image = Image.new
  end

  def create

    product = Product.new(product_params)
    if product.save!
      id = product.id
      image = Image.new(image_params(id))
      image.save
      redirect_to root_path
    end
  end

  def buy
  end

  private
  def product_params
    params.require(:product).permit(:name,:detail,:big_category_id,:middle_category_id,:small_category_id,:brand_id,:delivary_day_id,:delivary_fee_id,:delivary_way_id,:shipping_origin_id,:status_id,:price).merge(listing_status:"出品中",user_id:current_user.id)
  end

  def image_params(id)
    params.require(:product).permit(:image).merge(product_id:id)
  end

end
