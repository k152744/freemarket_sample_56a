class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show]

  def index
  end

  def show
  end

  def edit
  end
  

  def new
  end

  def buy
  end
end
