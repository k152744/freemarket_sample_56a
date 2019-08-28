class CommentsController < ApplicationController
  def stamp
    @product = Product.find(params[:product])
    @comment = Comment.new(user_id: current_user.id,product_id: params[:product],stamp: params[:stamp])
    if @comment.save! && @product.user != current_user
      @announce = Announce.create(active_user_id: current_user.id, product_id: @product.id, user_id: @product.user.id, comment_id: @comment.id)
    end
  end
  def create
    @product = Product.find(params[:product])
    @comment = @product.comments.new(comment_params)
    if @comment.save && @product.user != current_user
      @announce = Announce.create(active_user_id: current_user.id, product_id: @product.id, user_id: @product.user.id, comment_id: @comment.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
