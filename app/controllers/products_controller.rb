class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show]
  before_action :header_big_category, only: [:index,:show,:search,:search_another]
  before_action :header_brand, only: [:index,:show,:search ,:search_another]
  
  def index
    @pickup_categories = BigCategory.all.limit(3).includes(:products)
    @pickup_brands = Brand.all.limit(3).includes(:products) 
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

  def search
    @keyword = params[:q][:name_cont]
    @search = Product.ransack(params[:q])
    @big_category = BigCategory.pluck(:name)
    @middle_category = ""
    @small_category = SmallCategory.all
    @products = @search.result
    
  end
  
  def search_another
    @keyword = params[:keyword]
    @big_category = BigCategory.pluck(:name)
    @middle_category = ""
    @small_category = SmallCategory.all
    @search = Product.ransack(params[:q])
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").limit(132)
    render template: "products/search" 
  end

  def category
    bigcategory=BigCategory.where("name = ?",params[:keyword])
    @middlecategory=MiddleCategory.where("big_category_id = ?",bigcategory[0].id)
    respond_to do |format|
      format.html { render :template => "products/search" }
      format.json
    end
  end

  def category_middle
    
    middlecategory = MiddleCategory.where("(name = ?) and (big_category_id = ?)",params[:keyword],params[:id])
    @smallcategory = SmallCategory.where("middle_category_id = ?",middlecategory[0].id)
    respond_to do |format|
      format.html { render :template => "products/search" }
      format.json
    end
  end

  private
  def product_params
    params.require(:product).permit(:name,:detail,:big_category_id,:middle_category_id,:small_category_id,:brand_id,:delivary_day_id,:delivary_fee_id,:delivary_way_id,:shipping_origin_id,:status_id,:price).merge(listing_status:"出品中",user_id:current_user.id)
  end

  def image_params(id)
    params.require(:product).permit(:image).merge(product_id:id)
  end

end
