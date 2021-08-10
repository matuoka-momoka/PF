class MensoresController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @mensore = Mensore.find(params[:id])
    @mensore_comment = MensoreComment.new
    render "hoges/hige"
  end
  
  

  def index
    @mensores = Mensore.all
    @mensore = Mensore.new
  end

  def create
    @mensore = Mensore.new(mensore_params)
    @mensore.user_id = current_user.id
    if @mensore.save
      redirect_to mensore_path(@mensore), notice: "できた〜."
    else
      @mensores = Mensore.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @mensore.update(mensore_params)
      redirect_to mensore_path(@mensore), notice: "できたよー."
    else
      render "edit"
    end
  end

  def destroy
    @mensore.destroy
    redirect_to mensore_path
  end

  private

  def mensore_params
    params.require(:mensore).permit(:title, :body)
  end

  def ensure_correct_user
    @mensore = Mensore.find(params[:id])
    unless @Mensore.user == current_user
      redirect_to mensores_path
    end
  end
end
