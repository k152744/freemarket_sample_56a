class UsersController < ApplicationController
  before_action :header_big_category, only: [:index,:edit, :logout,:add_card,:show]
  before_action :header_brand, only: [:index,:edit ,:logout,:add_card,:show]

  def edit
  end
  def logout
  end
  def show
     @favorited_all = Favorite.where("(user_id = ?)", current_user.id ).includes(:product)
     
  end

end
