# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/NumericLiterals, Metrics/BlockLength
module Events
  RSpec.describe CheckStatus do
    context 'happy path' do
      # Just seed the database once to save test execution time, we're querying
      # the same parsed CSV anyway
      before(:all) do
        csv_path = './spec/fixtures/example.csv'
        Events::ParseCsv.new(csv_path: csv_path).call
      end
      after(:all) { Event.destroy_all }
      let!(:object_params) { { object_id: 1, object_type: 'Order' } }

      it 'timestamp is before any event has happened - return an empty hash' do
        state = described_class.new(
          object_params.merge(timestamp: 1484722542)
        ).call

        expect(state).to eq({})
      end

      it 'timestamp is after two events have transpired: the later states ' \
        'override the previous ones' do
        state = described_class.new(
          object_params.merge(timestamp: 1484733173)
        ).call

        expect(state).to eq(
          'customer_name' => 'Jack',
          'customer_address' => 'Trade St.',
          'status' => 'paid',
          'ship_date' => '2017-01-18',
          'shipping_provider' => 'DHL'
        )
      end

      it 'timestamp is in the middle of two events: traverse through events '\
        'up to that time' do
        state = described_class.new(
          object_params.merge(timestamp: 1484731400)
        ).call

        expect(state).to eq(
          'customer_name' => 'Jack',
          'customer_address' => 'Trade St.',
          'status' => 'unpaid'
        )
      end
    end
  end
end
# rubocop:enable Style/NumericLiterals, Metrics/BlockLength
