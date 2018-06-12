# frozen_string_literal: true

require 'csv'

module Events
  class ParseCsv
    attr_reader :csv_path

    EVENT_COLUMNS = %w[object_id object_type timestamp payload].freeze
    POSSIBLE_OBJECT_TYPES = %w[Order Product Invoice].freeze

    def initialize(csv_path:)
      @csv_path = csv_path
    end

    def call
      return GradeteckoError.new unless csv_file?

      ApplicationRecord.transaction do
        events_to_import = []
        File.foreach(csv_path) do |line|
          events_to_import << event_params_from_line(line)
        end

        # Skip AR validations to speed up import
        Event.import(EVENT_COLUMNS, events_to_import, validate: true)

        return SuccessfulOperation.new
      rescue JSON::ParserError
        raise ActiveRecord::Rollback
      end

      GradeteckoError.new
    end

    private

    def csv_file?
      Rack::Mime.mime_type(File.extname(csv_path)) == 'text/csv'
    end

    def event_params_from_line(line)
      object_id, object_type, timestamp, *payload = line.split(',')

      [object_id, validate_type(object_type), validate_timestamp(timestamp), fix_payload(payload)]
    end

    def validate_type(object_type)
      raise ActiveRecord::Rollback unless object_type.in?(POSSIBLE_OBJECT_TYPES)

      object_type
    end

    # Attempt converting the timestamp to an int, just to make sure that
    def validate_timestamp(timestamp)
      raise ActiveRecord::Rollback if timestamp.blank?

      Time.at(Integer(timestamp))
    rescue ArgumentError
      raise ActiveRecord::Rollback
    end

    def fix_payload(payload)
      JSON.parse(JSON.parse(payload.join(',')))
    end
  end
end
