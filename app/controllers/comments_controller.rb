class CommentsController < ApplicationController
  def create
    @cafe = Cafe.find(params[:cafe_id])
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :image, :cafe_id).merge(user_id: current_user.id, cafe_id: params[:cafe_id])
  end
end
