# frozen_string_literal: true

require 'csv'

module Events
  class ParseCsv
    attr_reader :csv_path

    EVENT_COLUMNS = %w[object_id object_type timestamp payload].freeze

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

      [object_id, object_type, Time.at(timestamp.to_i), fix_payload(payload)]
    end

    def fix_payload(payload)
      JSON.parse(JSON.parse(payload.join(',')))
    end
  end
end
