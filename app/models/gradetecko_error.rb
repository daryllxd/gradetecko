# frozen_string_literal: true

class GraeteckoError < StandardError
  def valid?
    false
  end
end
