class TeamController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
  end

  def new
  end

  def create
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
