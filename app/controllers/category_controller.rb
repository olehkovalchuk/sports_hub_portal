class CategoryController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @categoty = Category.all
  end

  def new
  end

  def create
  end

  # навіщо ми оголошуємо @teams та @articles? ми мажмо взяти це вже в середині типу @categoty.teams
  def show
    @categoty = Category.find(params[:id])
    @teams = Team.where(category_id: @categoty.subtree_ids)
    @articles = Article.where(category_id: @categoty.subtree_ids)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
