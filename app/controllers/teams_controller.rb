class TeamsController < ApplicationController

  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.users << current_user

    if @team.save
      flash[:success] = "Team created successfully"
      redirect_to teams_url
    else
      render :new
    end
  end

  def edit
    @team = current_user.teams.find(params[:id])
  end

  def update
    if @team.update(team_params)
      flash[:success] = "#{@team.name} updated successfully"
      redirect_to @team
    else
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:name).tap do |params|
      params[:captain] = current_user
    end
  end
end
