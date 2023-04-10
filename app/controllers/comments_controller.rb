class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
  end
  

  def create
    @comment = current_user.comments.new(article: article, **comment_params)
    if @comment.depth > 2
      redirect_to article, danger: "And add so deep subcomment"
      return
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to article, success: "Comment added" }
      else
        format.html { redirect_to article, danger: @comment.errors.first.type }
      end
    end
  end

  def show
  end

  def update
    @comment = Comment.find(comment_params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article, success: "Comment updated" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to article, success: "Comment deleted" }
      end
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :text, :parent_id)
  end
  
  def article
    # @article ||= current_user.articles.find(params[:article_id])
    @article ||= Article.find(params[:article_id])
  end
  
end
