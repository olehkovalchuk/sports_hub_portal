class TeamController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
  end

  def new
  end

  def create
  end

  # навіщо ми оголошуємо @articles? ми мажмо взяти це вже в середині типу @team.teams
  def show
    @team = Team.find(params[:id])
    @articles = @team.articles
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
