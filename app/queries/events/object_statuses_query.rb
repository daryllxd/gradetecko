# frozen_string_literal: true

module Events
  class ObjectStatusesQuery
    attr_reader :object_id, :object_type, :timestamp

    def initialize(object_id:, object_type:, timestamp:)
      @object_id = object_id
      @object_type = object_type
      @timestamp = timestamp
    end

    def call
      Event.where(
        'object_id = ? AND object_type = ? AND timestamp <= ?',
        object_id, object_type, Time.at(timestamp)
      ).order('timestamp ASC')
    rescue TypeError
      # Catches nil and unparseable timestamps
      Event.none
    end
  end
end
