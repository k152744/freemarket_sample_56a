class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :header_big_category
  before_action :header_brand

  def index
    @category_all = BigCategory.all.includes(middle_categories: :small_categories)
  end
  def show
    @category = BigCategory.find(params[:id])
    @products = Product.where('(big_category_id = ?)', params[:id]).order("created_at DESC")
  end
  def middle
    @category = MiddleCategory.find(params[:id])
    @products = Product.where('(middle_category_id = ?)', params[:id]).order("created_at DESC")
  end
  def small
    @category = SmallCategory.find(params[:id])
    @products = Product.where('(small_category_id = ?)', params[:id]).order("created_at DESC")
  end
  
  def search
    if params[:select_number] == "0"
      @middlecategories = MiddleCategory.where('(big_category_id = ?)', params[:id])
    end
  end
end
