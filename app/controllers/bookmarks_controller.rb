class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @mensore = Mensore.find(params[:mensore_id])
    @bookmark = @mensore.bookmarks.new(user_id: current_user.id)
    @bookmark.save
  end

  def destroy
    @mensore = Mensore.find(params[:mensore_id])
    @bookmark = @mensore.bookmarks.find_by(params[:id])
    @bookmark.destroy
  end
  
  
end
