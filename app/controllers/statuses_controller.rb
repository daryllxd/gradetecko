# frozen_string_literal: true

class StatusesController < ApplicationController
  def index
    object_status = Events::CheckStatus.new(
      object_status_params
    ).call

    flash[:success] = if object_status.present?
                        object_status.to_s
                      else
                        "Object didn't exist at that time."
                      end

    @object_types = %w[Order Product Invoice].freeze
  end

  private

  def object_status_params
    {
      object_id: params[:object_id],
      object_type: params[:object_type],
      timestamp: params[:timestamp].to_i
    }
  end
end
