class TournamentsController < ApplicationController
  before_action :authenticate_user!, only: [:registration]

  def show
    @event = Event.find(params[:event_id])
    @tournament = @event.tournaments.includes(:entries).find(params[:id])
    @teams = Team.captain_teams(current_user)
  end

  def registration
    @event = Event.find(params[:event_id])
    @tournament = @event.tournaments.includes(:entries).find(params[:id])
    @team = Team.captain_teams(current_user).find(params[:team])
  end
end
