class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @mensore = Mensore.find(params[:id])
    bookmark = current_user.bookmarks.new(mensore_id: @mensore.id)
    bookmark.save
  end

  def destroy
    @mensore = Mensore.find(params[:id])
    bookmark = current_user.bookmarks.find_by(mensore_id: @mensore.id)
    bookmark.destroy
  end
  
  def index
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks
    @mensore = Mensore.new
    
  end
    
  
end
