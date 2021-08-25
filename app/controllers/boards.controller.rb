class BoardsController < ApplicationController
    def bookmarks
      @board = current_user.bookmark_boards.includes(:user).order(created_at: :desc)
    end
end