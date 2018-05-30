# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :ensure_events_csv_exists, only: [:create]

  def create
    events = Events::ParseCsv.new(
      csv_path: params[:events].path
    ).call

    if events.valid?
      flash[:success] = "#{params[:events].original_filename} was seeded!"
    else
      flash[:danger] = "Error with seeding #{params[:events].original_filename}."
    end

    redirect_to events_path
  end

  def index; end

  private

  def ensure_events_csv_exists
    unless params[:events].present?
      flash[:danger] = 'Nothing was uploaded.'
      redirect_to events_path
    end
  end
end
