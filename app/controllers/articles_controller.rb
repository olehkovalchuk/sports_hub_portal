class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @articles = Article.published.limit(5)
  end

  def new
  end

  def create
  end

  def show
    @article = Article.find(params[:id])
    # @new_comment = @article.comments.build
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
