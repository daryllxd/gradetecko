# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GradeteckoError do
  context 'creation' do
    subject { described_class.new }

    it { should_not be_valid }
  end
end
