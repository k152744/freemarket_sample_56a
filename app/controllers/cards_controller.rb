class CardsController < ApplicationController
  before_action :header_big_category
  before_action :header_brand
  require "payjp"

  def index
    # card = Card.where(user_id: current_user.id).first
    # if card.present?
    #   Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    #   customer = Payjp::Customer.retrieve(card.customer_id)
    #   @card = customer.cards.retrieve(card.card_id)
    # else
    #   redirect_to "cards#registrate"
    # end
  end

  def registrate
    redirect_to action: "index" if Card.where(user_id: current_user.id).present?
  end

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test-card',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id, user_name: current_user.nickname}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    product = Product.find(params[:product_id])
    if card.blank? || product.blank? || product.user_id == current_user.id
      redirect_to controller: "products", action:"buy"
    else
      if product.buyer_id.present?
        redirect_to controller: "products", action:"show"
      else
        Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
        Payjp::Charge.create(
          description: 'test-pay',
          amount: product.price,
          customer: card.customer_id,
          currency: 'jpy',
          metadata: {buyer_id: current_user.id, buyer_name: current_user.nickname}
        )
        product.update(buyer_id: current_user.id)
      end
    end
  end
  def snow
  end
end
