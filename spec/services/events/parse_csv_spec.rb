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
    end

    context 'error in parsing' do
      it 'nothing gets persisted and an error is returned' do
        csv_path = './spec/fixtures/incomplete_example.csv'

        result = described_class.new(csv_path: csv_path).call

        expect(Event.count).to eq(0)
        expect(result).not_to be_valid
      end
    end
  end
end
