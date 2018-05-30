# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SuccessfulOperation do
  context 'creation' do
    subject { described_class.new }

    it { should be_valid }
  end
end
