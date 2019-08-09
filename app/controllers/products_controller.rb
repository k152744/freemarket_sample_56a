class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show]

  def index
  end

  def show
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
