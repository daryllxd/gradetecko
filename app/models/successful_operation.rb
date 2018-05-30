# frozen_string_literal: true

# Value object to state if an operation was successful or not.
# Used when parsing CSV just so we can return something to the
# front-end saying that the CSV was parsed
class SuccessfulOperation
  def valid?
    true
  end
end
