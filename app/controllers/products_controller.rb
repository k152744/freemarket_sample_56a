class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show,:search,:search_another]
  before_action :set_product,only: [:destroy,:update]
  before_action :header_big_category, only: [:index,:show,:detail,:edit,:destroy,:search,:search_another]
  before_action :header_brand, only: [:index,:show,:detail,:edit,:destroy,:search,:search_another]
  
  def index
    @pickup_categories = BigCategory.all.limit(3).includes(:products)
    @pickup_brands = Brand.all.limit(3).includes(:products)
    
  end

  def show
    @product = Product.includes(:user,:big_category,:middle_category,:small_category,:brand,:delivary_day,:delivary_fee,:delivary_way,:shipping_origin,:status,:images).find(params[:id])
    @user_other_products = Product.where('(user_id = ?) and (id != ?)', @product.user_id, @product.id).order("created_at DESC").limit(6)
    @other_products = Product.where('(brand_id = ?) and (small_category_id = ?) and (id != ?)', @product.brand_id, @product.small_category_id, @product.id).order("created_at DESC").limit(6)
    @favorite  = Favorite.where("(product_id = ?)",params[:id])
    @favorited = Favorite.where("(user_id = ?)and(product_id = ?)",current_user.id,params[:id]) if user_signed_in?

  end

  def edit
    @product = Product.includes(:user,:big_category,:middle_category,:small_category,:brand,:delivary_day,:delivary_fee,:delivary_way,:shipping_origin,:status,:images).find(params[:id])
    if current_user.id == @product.user_id
      @big_category = BigCategory.all
      @middle_category = MiddleCategory.where('(big_category_id = ? )',@product.big_category_id)
      @small_category = SmallCategory.where('(middle_category_id = ? )',@product.middle_category_id)
      @delivary_day = DelivaryDay.all
      @delivary_fee = DelivaryFee.all
      @delivary_way = DelivaryWay.all
      @shipping_origin = ShippingOrigin.all
      @status = Status.all
      @brand = Brand.find(@product.brand_id)
      @image = Image.where("product_id = ?",@product.id)
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.id == @product.user_id
      if @product.update(product_params)
        image = Image.where("product_id = ?",@product.id)
        # image.update(image_params(@product.id))
        redirect_to root_path
      else
        render :edit
      end
    end
  end



  def new
    @big_category = BigCategory.all
    @middle_category = MiddleCategory.all
    @small_category = SmallCategory.all
    @delivary_day = DelivaryDay.all
    @delivary_fee = DelivaryFee.all
    @delivary_way = DelivaryWay.all
    @shipping_origin = ShippingOrigin.all
    @status = Status.all

    @product = Product.new
    @image = Image.new
    
  end

  def create
    image_array = []
    product = Product.new(product_params) 
    image = Image.new(image_params)
    image.image.each do |data|
      image = Image.new
      image.image = data
      image_array.push(image)
    end
    if image_array.length != 0 || image_array.length > 10
      if product.save!
        image_array.each do |image|
          image.product_id = product.id
          image.save!
        end
        respond_to do |format|
          format.html {redirect_to root_path }
          format.json { render json: {id: product.id} }
        end
      else
        redirect_to action: "new"
      end
    else
      redirect_to action: "new"
    end
  end

  def destroy
    if current_user.id == @product.user_id
      if @product.destroy
          redirect_to listing_user_information_path(current_user),notice: '商品を削除しました'
      else
        render :detail
      end
    end
  end

  def buy
    @product = Product.find(params[:id])
    @points = Point.where("(user_id = ?)and(number > ?)",current_user.id,0)
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)

      case @card.brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end

    else
      @card = nil
      @card_src = nil
    end
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

  def detail
    @product = Product.includes(:user,:big_category,:middle_category,:small_category,:brand,:delivary_day,:delivary_fee,:delivary_way,:shipping_origin,:status,:images).find(params[:id])
    @favorite  = Favorite.where("(product_id = ?)",params[:id])
  end

  def favorite_create
    Favorite.find_or_create_by(user_id: current_user.id,product_id: params[:product_id].to_i)
    favorite_lenght =Favorite.where(product_id: params[:product_id].to_i).length
    respond_to do |format|
      format.html
      format.json { render json: favorite_lenght }
    end
  end

  def favorite_delete
    Favorite.where(user_id: current_user.id,product_id: params[:product_id].to_i).destroy_all
    favorite_lenght =Favorite.where(product_id: params[:product_id].to_i).length

    respond_to do |format|
      format.html
      format.json { render json: favorite_lenght }
    end
  end

  def brand_incremental
    @brands = Brand.where("name LIKE(?)", "%#{params[:keyword]}%")
  end

  def game
    point = params[:point].to_i
    if point > 0 
      Point.create(user_id: current_user.id,number: point)
    else
    end
    respond_to do |format|
      format.html
      format.json { render json: point }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name,:detail,:big_category_id,:middle_category_id,:small_category_id,:brand_id,:delivary_day_id,:delivary_fee_id,:delivary_way_id,:shipping_origin_id,:status_id,:price).merge(listing_status:"出品中",user_id:current_user.id)
  end

  def image_params
    params.require(:product).permit(image: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
