class EventsController < ApplicationController
  def new
    @event = current_user&.events.new()
  end

  def create
    @event = current_user&.events.new(event_params)
    if @event.save!
      flash[:notice] = 'Event created!'
      redirect_to events_path
    else
      
      flash[:alert] = 'Something Went Wrong'
    end
  end

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = current_user&.events.all
    # @events = current_user&.events.all
  end

  def show
    @event = current_user&.events&.find_by(id: params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :reason)
  end
end
