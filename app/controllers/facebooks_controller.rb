class FacebooksController < ApplicationController
  before_action :set_facebook, only: [:edit, :update, :destroy, :show]
  before_action :set_current_user_image, only: [:index, :edit, :show]
  before_action :authenticate_user!
  def index
    @facebooks = Facebook.all
    @facebook = Facebook.new
    @comment = @facebook.comments.build
    @comments = @facebook.comments
    @user = User.all
  end

  def new
  end

  def create
    @facebook = Facebook.new(facebooks_params)
    @facebook.user_id = current_user.id

    if @facebook.save
      redirect_to root_path, notice: "投稿しました！"
      NoticeMailer.sendmail_facebook(@facebook).deliver
    else
      redirect_to root_path, flash: { error: @facebook.errors.full_messages }
    end
  end

  def edit

  end

  def confirm
     @facebook = Facebook.new(facebooks_params)
  end

  def show
    @comment = @facebook.comments.build
    @comments = @facebook.comments
  end


  def update
    if @facebook.update(facebooks_params)
      redirect_to root_path, notice: "投稿内容を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @facebook.destroy
    redirect_to root_path, notice: "投稿内容を削除しました！"
  end

  def iine

  end

  private
    def facebooks_params
      #画像がアップロードできるようになったらpermitにimage_urlを追加する
      params.require(:facebook).permit(:content,:title, :content_image)
    end

    def set_facebook
      @facebook = Facebook.find(params[:id])
    end

    def set_current_user_image
      @current_user = current_user
    end
end
