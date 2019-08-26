class CommentsController < ApplicationController
  def stamp
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.product_id = params[:product].to_i
    @comment.stamp = params[:stamp].to_i
    @comment.save!
  end
  def create
    @product = Product.find(params[:product])
    @comment = @product.comments.new(comment_params)
    if @comment.save
      create_announce(@product,@comment)
      respond_to do |format|
        format.html
        format.json
      end
    else
      redirect_to "/product/#{@product.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
  def create_announce(product,comment)
    @announce = Announce.new
    @announce.push(active_user_id: current_user.id, product_id: product.id, user_id: product.user.id, comment_id: comment.id)
    binding.pry
  end
end
