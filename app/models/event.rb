# frozen_string_literal: true

class Event < ApplicationRecord
  POSSIBLE_OBJECT_TYPES = %w[Order Product Invoice].freeze

  validates :object_id, presence: true
  validates :object_type, presence: true, inclusion: POSSIBLE_OBJECT_TYPES
  validates :timestamp, presence: true
  validates :payload, presence: true
end
