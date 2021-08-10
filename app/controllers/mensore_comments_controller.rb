class MensoresCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @mensore = Mensore.find(params[:mensore_id])
    @mensore_comment = MensoreComment.new(mensore_comment_params)
    @mensore_comment.mensore_id = @mensore.id
    @mensore_comment.user_id = current_user.id
    unless @mensore_comment.save
      render 'error'
    end
  end

  def destroy
    @mensore = Mensore.find(params[:mensore_id])
    mensore_comment = @mensore.mensore_comments.find(params[:id])
    mensore_comment.destroy
  end

  private

  def mensore_comment_params
    params.require(:mensore_comment).permit(:comment)
  end
end
