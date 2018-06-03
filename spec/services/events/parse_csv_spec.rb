# frozen_string_literal: true

require 'rails_helper'

module Events
  RSpec.describe ParseCsv do
    context 'happy path' do
      it 'events get persisted and a SuccessfulOperation is returned' do
        csv_path = './spec/fixtures/example.csv'

        result = described_class.new(csv_path: csv_path).call

        expect(Event.count).to eq(7)
        expect(result).to be_valid
      end

      it 'performance: one query only to insert everything' do
        csv_path = './spec/fixtures/example.csv'

        expect { described_class.new(csv_path: csv_path).call }
          .to make_database_queries(count: 1, manipulative: true)
      end
    end

    context 'errors' do
      context 'not even a text file' do
        it 'nothing gets persisted and an error is returned' do
          csv_path = './public/apple-touch-icon.png'

          result = described_class.new(csv_path: csv_path).call

          expect(Event.count).to eq(0)
          expect(result).not_to be_valid
        end
      end

      context 'CSV, but error in parsing' do
        it 'nothing gets persisted and an error is returned' do
          csv_path = './spec/fixtures/incomplete_example.csv'

          result = described_class.new(csv_path: csv_path).call

          expect(Event.count).to eq(0)
          expect(result).not_to be_valid
        end
      end
    end
  end
end
