class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @mensore = Mensore.find(params[:mensore_id])
    bookmark = @mensore.bookmark.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @mensore = Mensore.find(params[:mensore_id])
    bookmarked = @mensore.bookmark.find_by(user_id: current_user.id)
    bookmarked.destroy
  end
end
