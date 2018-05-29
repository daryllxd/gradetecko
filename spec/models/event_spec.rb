# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  POSSIBLE_OBJECT_TYPES = %w[Order Product Invoice].freeze

  it { should validate_presence_of(:object_id) }
  it do
    should validate_inclusion_of(:object_type).in_array(POSSIBLE_OBJECT_TYPES)
  end
  it { should validate_presence_of(:object_type) }
  it { should validate_presence_of(:timestamp) }
  it { should validate_presence_of(:payload) }
end
