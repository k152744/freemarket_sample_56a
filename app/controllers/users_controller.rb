class UsersController < ApplicationController
  before_action :header_big_category, only: [:index,:edit, :logout,:add_card]
  before_action :header_brand, only: [:index,:edit ,:logout,:add_card]

  def edit
  end
  def logout
  end

  def add_card
  end
end
