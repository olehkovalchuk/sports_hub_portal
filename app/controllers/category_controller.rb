class CategoryController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @categoty = Category.all
  end

  def new
  end

  def create
  end

  def show
    @categoty = Category.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
