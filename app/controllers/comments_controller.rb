class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy, :update,:show]
  def create
    @comment = current_user.comments.build(comment_params)
    @facebook = @comment.facebook

    respond_to do |format|
      if @comment.save
        format.html { redirect_to facebook_path(@facebook), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { redirect_to facebook_path(@facebook), notice: 'コメント投稿失敗'  }
        format.js { render :index }
      end
    end
  end

  def edit
    #どのブログの情報かを取得。
    @facebook = @comment.facebook
  end

  def update
    if @comment.update(comment_params)
      redirect_to facebook_path(@comment.facebook), notice: "コメントを更新しました"
    else
      render 'index'
    end
  end

  def show
    @facebook = @comment.facebook
    render 'index'
  end

  def destroy
    @comment.destroy
    flash.now[:message] = "コメントを削除しました！"
    #renderで非同期通信となる
    render 'index'
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:facebook_id, :content)
    end

    def set_comment
      #ブログのどのコメントの情報かを取得する
      @comment=Comment.find(params[:id])
    end
end
