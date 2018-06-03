# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/NumericLiterals, Metrics/BlockLength
module Events
  RSpec.describe ObjectStatusesQuery do
    context 'happy path' do
      before(:all) { create_sample_database }
      after(:all) { Event.destroy_all }

      let!(:object_params) { { object_id: 1, object_type: 'Order' } }

      context 'performance' do
        it 'uses an index' do
          queried_events = described_class.new(
            object_params.merge(timestamp: 1484733173)
          ).call

          expect(queried_events.explain).to include(
            'Index Scan using index_events_on_object_type_and_object_id_and_timestamp on events'
          )
        end
      end
    end

    context 'errors' do
      context 'timestamp is nil' do
        it 'returns an empty AR relation' do
          queried_events = described_class.new(
            object_id: nil, object_type: nil, timestamp: nil
          ).call

          expect(queried_events).to be_a_kind_of(ActiveRecord::Relation)
          expect(queried_events).to be_empty
        end
      end
      context 'timestamp is unparseable' do
        it 'returns an empty AR relation' do
          queried_events = described_class.new(
            object_id: nil, object_type: nil, timestamp: 'what'
          ).call

          expect(queried_events).to be_a_kind_of(ActiveRecord::Relation)
          expect(queried_events).to be_empty
        end
      end
    end
  end
end
# rubocop:enable Style/NumericLiterals, Metrics/BlockLength
