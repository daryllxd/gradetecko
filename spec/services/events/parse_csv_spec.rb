# frozen_string_literal: true

require 'rails_helper'

module Events
  RSpec.describe ParseCsv do
    context 'happy path' do
      it 'parses the CSV' do
        csv_path = './spec/fixtures/example.csv'

        described_class.new(csv_path: csv_path).call

        expect(Event.count).to eq(7)
      end
    end

    context 'error in parsing' do
      it 'nothing gets persisted' do
        csv_path = './spec/fixtures/incomplete_example.csv'

        described_class.new(csv_path: csv_path).call

        expect(Event.count).to eq(0)
      end
    end
  end
end
