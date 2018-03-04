class EntriesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @tournament = @event.tournaments.includes(:entries).find(params[:tournament_id])
    @entry = @tournament.entries.build(entry_params)

    if @entry.save
      flash[:success] = "Registered successfully"
      redirect_to [@event, @tournament]
    else
      flash[:error] = "Failed to register"
      redirect_to [@event, @tournament]
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:team_id, :tournament_id)
  end
end
