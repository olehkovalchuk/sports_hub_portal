class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
