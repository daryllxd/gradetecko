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
      return {} if events.empty?

      events.each_with_object({}) do |current_event, accumulator|
        accumulator.merge!(current_event.payload)
      end
    end

    private

    def events
      Events::ObjectStatusesQuery.new(
        object_id: object_id,
        object_type: object_type,
        timestamp: timestamp
      ).call
    end
  end
end
