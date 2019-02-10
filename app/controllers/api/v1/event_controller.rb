module Api::V1
  class EventController < ApplicationController
    def index
      @events = Event.order(id: :desc)
      render(json: @events, status: 200) && return if @events.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def show
      @event = Event.find(params[:id])
      render(json: 'Not found', serializer: ErrorSerializer, status: 404) && return unless @event.present?
      render(json: @event, status: 200)
    end

    def create
      @event = Event.create(permitted_params)
      render(json: @event, status: 201) && return if @event.save
      render(json: 'Error', serializer: ErrorSerializer, status: 400)
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      render(json: @event, status: 200)
    end

    def update
      @event = Event.find(params[:id])
      render(json: @event, status: 200) && return if @event.update_attributes(permitted_params)
      render(json: 'Event not update', serializer: ErrorSerializer, status: 400)
    end

    private

    def permitted_params
      params.permit(:name, :description, :lat, :lng)
    end
  end
end