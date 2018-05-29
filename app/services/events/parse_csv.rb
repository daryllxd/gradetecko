# frozen_string_literal: true

require 'csv'

module Events
  class ParseCsv
    attr_reader :csv_path

    def initialize(csv_path:)
      @csv_path = csv_path
    end

    def call
      ApplicationRecord.transaction do
        File.foreach(csv_path) do |line|
          create_event(line)
        end

      rescue JSON::ParserError
        raise ActiveRecord::Rollback
      end
    end

    private

    def create_event(line)
      object_id, object_type, timestamp, *payload = line.split(',')

      Event.create!(
        object_id: object_id,
        object_type: object_type,
        timestamp: Time.at(timestamp.to_i),
        payload: fix_payload(payload)
      )
    end

    def fix_payload(payload)
      JSON.parse(JSON.parse(payload.join(',')))
    end
  end
end
