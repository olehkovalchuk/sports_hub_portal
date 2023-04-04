class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
  end
  

  def create
    if current_user.admin?
      redirect_to article_path(comment_params[:article_id]), danger: "Admin can't add comments" and return
    end
    @comment = Comment.new(
      text: comment_params[:text], 
      article_id: params[:article_id], 
      author_id: current_user.id
    )
    @comment.parent = Comment.find(params[:parent_id]) if Comment.exists?(id: params[:parent_id])

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @comment.article, success: "Comment added" }
      end
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :article_id)
  end
  
 
  
end
