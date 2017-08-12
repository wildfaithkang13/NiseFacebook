class FacebooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @facebooks = Facebook.all
    @facebook = Facebook.new
  end

  def new
  end

  def create
    Facebook.create(facebooks_params)
    redirect_to root_path
  end

  private
    def facebooks_params
      #画像がアップロードできるようになったらpermitにimage_urlを追加する
      params.require(:facebook).permit(:content, :image_url)
    end

end
