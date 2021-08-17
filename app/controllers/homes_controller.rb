class HomesController < ApplicationController
  def top
  @mensores = Mensore.search(params[:search])
  end

  def search
  @mensores = Mensore.search(params[:search])
  end

  def about
  end

end
