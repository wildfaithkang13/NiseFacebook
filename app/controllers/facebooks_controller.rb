class FacebooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @facebooks = Facebook.all
    @facebook = Facebook.new
  end

  def new
  end

  def create
    #Facebook.create(facebooks_params)
    @facebook = Facebook.new(facebooks_params)
    @facebook.user_id = current_user.id

    if @facebook.save
      redirect_to root_path, notice: "ブログを作成しました！"
    else
      redirect_to root_path, notice: "ブログを作成失敗！"
    end


    #redirect_to root_path
  end

  private
    def facebooks_params
      #画像がアップロードできるようになったらpermitにimage_urlを追加する
      params.require(:facebook).permit(:content,:title, :image_url)
    end

end
