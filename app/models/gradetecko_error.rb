# frozen_string_literal: true

class GradeteckoError < StandardError
  def valid?
    false
  end
end
