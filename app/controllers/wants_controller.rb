class WantsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    @want = current_user.wants.build(want_params)
    if @want.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to user_path
    else
      @pagy, @wants = pagy(current_user.wants.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      redirect_to root_url
    end
    end
  end

  def destroy
    @want.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: user_path)
  end

  private

  def want_params
    params.require(:want).permit(:content,:image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end

