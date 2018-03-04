class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def index
    @teams = current_user.teams if current_user
    @recruiting_teams = Team.where(recruiting: true)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.users << current_user

    if @team.save
      flash[:success] = "Team created successfully"
      redirect_to @team
    else
      render :new
    end
  end

  def edit
    @team = current_user.teams.find(params[:id])
  end

  def update
    @team = current_user.teams.find(params[:id])
    if @team.update(team_params)
      flash[:success] = "#{@team.name} updated successfully"
      redirect_to teams_url
    else
      render :edit
    end
  end

  def join_team
    @team = Team.find(params[:id])

    @team.users << current_user

    flash[:success] = "Thanks for joining #{@team.name}"

    redirect_to @team
  end

  private

  def team_params
    params.require(:team).permit(:name, :recruiting).tap do |params|
      params[:captain] = current_user
    end
  end
end
