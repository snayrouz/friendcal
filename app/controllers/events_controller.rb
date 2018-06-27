class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy ]

  def index

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def show

  end

  def edit

  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

    def event_params
      params.require(:event).permit(:title,:date_range, :start, :end, :color)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end