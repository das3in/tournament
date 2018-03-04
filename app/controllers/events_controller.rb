class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.includes(:tournaments).find(params[:id])
  end
end
