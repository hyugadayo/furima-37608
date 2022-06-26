class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comment_channel", {comment: @comment, useer: @comment.}
    end
  end

  private
  def comment_param
    params.require(:comment).permit(:text).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
