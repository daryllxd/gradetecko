# frozen_string_literal: true

module Events
  class CheckStatus
    attr_reader :object_id, :object_type, :timestamp

    def initialize(object_id:, object_type:, timestamp:)
      @object_id = object_id
      @object_type = object_type
      @timestamp = timestamp
    end

    def call
      events = Event.where(
        'object_id = ? AND object_type = ? AND timestamp <= ?',
        object_id, object_type, Time.at(timestamp)
      ).order('timestamp ASC')

      events.each_with_object({}) do |current_event, accumulator|
        accumulator.merge!(current_event.payload)
      end
    end
  end
end
