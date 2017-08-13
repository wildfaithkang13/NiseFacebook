class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @facebook = @comment.blog

    respond_to do |format|
      if @comment.save
        format.html { redirect_to facebook_path(@facebook), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { redirect_to facebook_path(@facebook), notice: 'コメント投稿失敗'  }
        format.html { render :index }
      end
    end

    private
      # ストロングパラメーター
      def comment_params
        params.require(:comment).permit(:facebook_id, :content)
      end
  end
end
